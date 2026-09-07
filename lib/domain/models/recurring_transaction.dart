import 'package:freezed_annotation/freezed_annotation.dart';

part 'recurring_transaction.freezed.dart';
part 'recurring_transaction.g.dart';

/// Clean domain model for Recurring Transaction
@freezed
class RecurringTransaction with _$RecurringTransaction {
  const factory RecurringTransaction({
    required int id,
    required double amount,
    required String type, // 'income' or 'expense'
    required int categoryId,
    required String categoryName,
    required RecurrenceFrequency frequency,
    required DateTime startDate,
    DateTime? endDate,
    DateTime? lastGenerated,
    required DateTime nextDueDate,
    String? note,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _RecurringTransaction;

  factory RecurringTransaction.fromJson(Map<String, dynamic> json) =>
      _$RecurringTransactionFromJson(json);
}

/// Recurrence frequency enum
enum RecurrenceFrequency {
  daily,
  weekly,
  monthly;

  String get displayName {
    switch (this) {
      case RecurrenceFrequency.daily:
        return 'Daily';
      case RecurrenceFrequency.weekly:
        return 'Weekly';
      case RecurrenceFrequency.monthly:
        return 'Monthly';
    }
  }

  String get description {
    switch (this) {
      case RecurrenceFrequency.daily:
        return 'Every day';
      case RecurrenceFrequency.weekly:
        return 'Every week';
      case RecurrenceFrequency.monthly:
        return 'Every month';
    }
  }
}