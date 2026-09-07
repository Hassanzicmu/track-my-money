import 'package:drift/drift.dart';

/// Database table for financial goals
class GoalEntities extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 100)();

  IntColumn get targetAmount => integer()();

  IntColumn get currentAmount => integer().withDefault(const Constant(0))();

  DateTimeColumn get targetDate => dateTime()();

  TextColumn get category => text().withLength(max: 50).nullable()();

  TextColumn get notes => text().withLength(max: 500).nullable()();

  BoolColumn get enableReminders => boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}