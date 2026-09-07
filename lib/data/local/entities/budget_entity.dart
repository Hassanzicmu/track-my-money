import 'package:drift/drift.dart';
import 'category_entity.dart';

/// Database table for budgets
class BudgetEntities extends Table {
  // Primary key
  IntColumn get id => integer().autoIncrement()();

  // Foreign key to category
  IntColumn get categoryId => integer().references(CategoryEntities, #id, onDelete: KeyAction.cascade)();

  // Budget amount in cents
  IntColumn get amountInCents => integer()();

  // Month (1-12)
  IntColumn get month => integer()();

  // Year (e.g., 2024)
  IntColumn get year => integer()();

  // Timestamps
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
    {categoryId, month, year}, // One budget per category per month
  ];
}