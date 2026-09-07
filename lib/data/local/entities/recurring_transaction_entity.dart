import 'package:drift/drift.dart';
import 'category_entity.dart';

/// Database table for recurring transactions
class RecurringTransactionEntities extends Table {
  // Primary key
  IntColumn get id => integer().autoIncrement()();

  // Amount in cents
  IntColumn get amountInCents => integer()();

  // Type: 'income' or 'expense'
  TextColumn get type => text().withLength(min: 1, max: 10)();

  // Foreign key to category
  IntColumn get categoryId => integer().references(CategoryEntities, #id, onDelete: KeyAction.setNull)();

  // Frequency: 'daily', 'weekly', 'monthly'
  TextColumn get frequency => text().withLength(min: 1, max: 10)();

  // When to start generating transactions
  DateTimeColumn get startDate => dateTime()();

  // Optional end date
  DateTimeColumn get endDate => dateTime().nullable()();

  // Last date a transaction was generated
  DateTimeColumn get lastGenerated => dateTime().nullable()();

  // Next date a transaction should be generated
  DateTimeColumn get nextDueDate => dateTime()();

  // Optional note
  TextColumn get note => text().withLength(max: 200).nullable()();

  // Is this recurrence active or paused?
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  // Timestamps
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}