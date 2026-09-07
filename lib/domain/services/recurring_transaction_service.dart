import '../models/recurring_transaction.dart';
import '../models/transaction.dart';
import '../repositories/recurring_transaction_repository.dart';
import '../repositories/transaction_repository.dart';

/// Service for handling recurring transaction business logic
class RecurringTransactionService {
  final RecurringTransactionRepository _recurringRepo;
  final TransactionRepository _transactionRepo;

  RecurringTransactionService(this._recurringRepo, this._transactionRepo);

  /// Generate all due transactions
  Future<int> generateDueTransactions() async {
    final dueRecurrences = await _recurringRepo.getDueRecurringTransactions();
    int generatedCount = 0;

    for (var recurrence in dueRecurrences) {
      // Skip if end date reached
      if (recurrence.endDate != null &&
          recurrence.nextDueDate.isAfter(recurrence.endDate!)) {
        continue;
      }

      // Generate all missed transactions until caught up
      DateTime currentDue = recurrence.nextDueDate;
      final today = DateTime.now();

      while (currentDue.isBefore(today) || _isSameDay(currentDue, today)) {
        // Check if transaction already exists for this date
        final exists = await _recurringRepo.transactionExistsForDate(
          recurrence.id,
          currentDue,
        );

        if (!exists) {
          // Generate transaction
          await _generateTransaction(recurrence, currentDue);
          generatedCount++;
        }

        // Calculate next due date
        final nextDue = calculateNextDueDate(currentDue, recurrence.frequency);

        // Update recurrence
        await _recurringRepo.updateGenerationDates(
          recurrence.id,
          currentDue,
          nextDue,
        );

        currentDue = nextDue;

        // Safety check: stop if end date reached
        if (recurrence.endDate != null &&
            currentDue.isAfter(recurrence.endDate!)) {
          break;
        }

        // Safety check: don't generate more than 100 transactions at once
        if (generatedCount >= 100) {
          break;
        }
      }
    }

    return generatedCount;
  }

  /// Generate a single transaction from recurrence
  Future<int> _generateTransaction(
      RecurringTransaction recurrence,
      DateTime date,
      ) async {
    return await _transactionRepo.addTransaction(
      amount: recurrence.amount,
      type: recurrence.type == 'income'
          ? TransactionType.income
          : TransactionType.expense,
      category: recurrence.categoryName,
      date: date,
      note: recurrence.note != null
          ? '🔄 ${recurrence.note}'
          : '🔄 Auto-generated',
      // TODO: Uncomment once TransactionRepository is updated to accept recurringTransactionId
      // recurringTransactionId: recurrence.id,
    );
  }

  /// Calculate next due date based on frequency
  DateTime calculateNextDueDate(
      DateTime current,
      RecurrenceFrequency frequency,
      ) {
    switch (frequency) {
      case RecurrenceFrequency.daily:
        return DateTime(
          current.year,
          current.month,
          current.day + 1,
        );

      case RecurrenceFrequency.weekly:
        return DateTime(
          current.year,
          current.month,
          current.day + 7,
        );

      case RecurrenceFrequency.monthly:
      // Handle month edge cases (e.g., Jan 31 → Feb 28)
        return _getValidMonthlyDate(
          current.year,
          current.month + 1,
          current.day,
        );
    }
  }

  /// Get valid date for monthly recurrence (handles edge cases)
  DateTime _getValidMonthlyDate(int year, int month, int dayOfMonth) {
    // Handle year rollover
    if (month > 12) {
      year += month ~/ 12;
      month = month % 12;
      if (month == 0) {
        month = 12;
        year -= 1;
      }
    }

    // Get last day of target month
    final lastDayOfMonth = DateTime(year, month + 1, 0).day;

    // Use the smaller of requested day or last day of month
    final validDay = dayOfMonth > lastDayOfMonth ? lastDayOfMonth : dayOfMonth;

    return DateTime(year, month, validDay);
  }

  /// Check if two dates are the same day
  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  /// Get description of when next transaction will be generated
  String getNextDueDescription(RecurringTransaction recurrence) {
    final now = DateTime.now();
    final nextDue = recurrence.nextDueDate;

    if (_isSameDay(nextDue, now)) {
      return 'Due today';
    }

    final difference = nextDue.difference(now).inDays;

    if (difference == 1) {
      return 'Due tomorrow';
    }

    if (difference < 7) {
      return 'Due in $difference days';
    }

    if (difference < 30) {
      final weeks = (difference / 7).floor();
      return 'Due in $weeks ${weeks == 1 ? 'week' : 'weeks'}';
    }

    final months = (difference / 30).floor();
    return 'Due in $months ${months == 1 ? 'month' : 'months'}';
  }

  /// Validate recurrence before creating
  String? validateRecurrence({
    required double amount,
    required DateTime startDate,
    DateTime? endDate,
  }) {
    if (amount <= 0) {
      return 'Amount must be greater than 0';
    }

    if (endDate != null && endDate.isBefore(startDate)) {
      return 'End date must be after start date';
    }

    return null; // Valid
  }
}
