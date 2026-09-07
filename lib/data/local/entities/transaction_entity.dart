import 'package:drift/drift.dart';

import 'recurring_transaction_entity.dart'; // ADD THIS

/// Database table for transactions
class TransactionEntities extends Table {
  // Primary key with auto-increment
  IntColumn get id => integer().autoIncrement()();

  // Amount of money (stored as integer in cents to avoid floating point issues)
  IntColumn get amountInCents => integer()();

  // Transaction type: 'income' or 'expense'
  TextColumn get type => text().withLength(min: 1, max: 10)();

  // Category like 'Food', 'Salary', 'Transport'
  TextColumn get category => text().withLength(min: 1, max: 50)();

  // When the transaction occurred
  DateTimeColumn get date => dateTime()();

  // Optional note/description
  TextColumn get note => text().withLength(max: 200).nullable()();

  // When this record was created (for tracking)
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  // NEW: Link to recurring transaction (if auto-generated)
  IntColumn get recurringTransactionId =>
      integer()
          .nullable()
          .references(RecurringTransactionEntities, #id,
          onDelete: KeyAction.setNull)();
}