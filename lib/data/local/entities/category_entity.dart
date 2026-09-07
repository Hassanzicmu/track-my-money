import 'package:drift/drift.dart';

/// Database table for categories
class CategoryEntities extends Table {
  // Primary key
  IntColumn get id => integer().autoIncrement()();

  // Category name (e.g., "Food & Dining")
  TextColumn get name => text().withLength(min: 1, max: 50)();

  // Type: 'income' or 'expense'
  TextColumn get type => text().withLength(min: 1, max: 10)();

  // Icon code point (Flutter's IconData.codePoint)
  IntColumn get iconCodePoint => integer()();

  // Color value (Color.value)
  IntColumn get colorValue => integer()();

  // Is this a default category or user-created?
  BoolColumn get isDefault =>
      boolean().withDefault(const Constant(false))();

  // Creation timestamp
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}
