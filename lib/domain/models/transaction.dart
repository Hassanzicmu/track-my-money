import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

/// Clean domain model for Transaction
@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required int id,
    required double amount,
    required TransactionType type,
    required String category,
    required DateTime date,
    String? note,
    required DateTime createdAt,
    int? recurringTransactionId, // NEW - nullable for backward compatibility
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}

/// Transaction type enum
enum TransactionType {
  income,
  expense;

  String get displayName {
    switch (this) {
      case TransactionType.income:
        return 'Income';
      case TransactionType.expense:
        return 'Expense';
    }
  }
}
