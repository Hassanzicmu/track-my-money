import 'package:drift/drift.dart';

/// Database table for investments
class InvestmentEntities extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 100)();

  TextColumn get assetType => text().withLength(min: 1, max: 20)();

  IntColumn get investedAmount => integer()();

  IntColumn get currentValue => integer()();

  DateTimeColumn get investmentDate => dateTime()();

  DateTimeColumn get maturityDate => dateTime().nullable()();

  TextColumn get notes => text().withLength(max: 500).nullable()();

  BoolColumn get isRecurring => boolean().withDefault(const Constant(false))();

  IntColumn get recurringAmount => integer().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}