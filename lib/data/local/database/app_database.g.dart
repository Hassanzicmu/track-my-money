// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CategoryEntitiesTable extends CategoryEntities
    with TableInfo<$CategoryEntitiesTable, CategoryEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryEntitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _iconCodePointMeta =
      const VerificationMeta('iconCodePoint');
  @override
  late final GeneratedColumn<int> iconCodePoint = GeneratedColumn<int>(
      'icon_code_point', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _colorValueMeta =
      const VerificationMeta('colorValue');
  @override
  late final GeneratedColumn<int> colorValue = GeneratedColumn<int>(
      'color_value', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isDefaultMeta =
      const VerificationMeta('isDefault');
  @override
  late final GeneratedColumn<bool> isDefault = GeneratedColumn<bool>(
      'is_default', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_default" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, type, iconCodePoint, colorValue, isDefault, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_entities';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('icon_code_point')) {
      context.handle(
          _iconCodePointMeta,
          iconCodePoint.isAcceptableOrUnknown(
              data['icon_code_point']!, _iconCodePointMeta));
    } else if (isInserting) {
      context.missing(_iconCodePointMeta);
    }
    if (data.containsKey('color_value')) {
      context.handle(
          _colorValueMeta,
          colorValue.isAcceptableOrUnknown(
              data['color_value']!, _colorValueMeta));
    } else if (isInserting) {
      context.missing(_colorValueMeta);
    }
    if (data.containsKey('is_default')) {
      context.handle(_isDefaultMeta,
          isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      iconCodePoint: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}icon_code_point'])!,
      colorValue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color_value'])!,
      isDefault: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_default'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $CategoryEntitiesTable createAlias(String alias) {
    return $CategoryEntitiesTable(attachedDatabase, alias);
  }
}

class CategoryEntity extends DataClass implements Insertable<CategoryEntity> {
  final int id;
  final String name;
  final String type;
  final int iconCodePoint;
  final int colorValue;
  final bool isDefault;
  final DateTime createdAt;
  const CategoryEntity(
      {required this.id,
      required this.name,
      required this.type,
      required this.iconCodePoint,
      required this.colorValue,
      required this.isDefault,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['icon_code_point'] = Variable<int>(iconCodePoint);
    map['color_value'] = Variable<int>(colorValue);
    map['is_default'] = Variable<bool>(isDefault);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CategoryEntitiesCompanion toCompanion(bool nullToAbsent) {
    return CategoryEntitiesCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      iconCodePoint: Value(iconCodePoint),
      colorValue: Value(colorValue),
      isDefault: Value(isDefault),
      createdAt: Value(createdAt),
    );
  }

  factory CategoryEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      iconCodePoint: serializer.fromJson<int>(json['iconCodePoint']),
      colorValue: serializer.fromJson<int>(json['colorValue']),
      isDefault: serializer.fromJson<bool>(json['isDefault']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'iconCodePoint': serializer.toJson<int>(iconCodePoint),
      'colorValue': serializer.toJson<int>(colorValue),
      'isDefault': serializer.toJson<bool>(isDefault),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CategoryEntity copyWith(
          {int? id,
          String? name,
          String? type,
          int? iconCodePoint,
          int? colorValue,
          bool? isDefault,
          DateTime? createdAt}) =>
      CategoryEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        iconCodePoint: iconCodePoint ?? this.iconCodePoint,
        colorValue: colorValue ?? this.colorValue,
        isDefault: isDefault ?? this.isDefault,
        createdAt: createdAt ?? this.createdAt,
      );
  CategoryEntity copyWithCompanion(CategoryEntitiesCompanion data) {
    return CategoryEntity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      iconCodePoint: data.iconCodePoint.present
          ? data.iconCodePoint.value
          : this.iconCodePoint,
      colorValue:
          data.colorValue.present ? data.colorValue.value : this.colorValue,
      isDefault: data.isDefault.present ? data.isDefault.value : this.isDefault,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('iconCodePoint: $iconCodePoint, ')
          ..write('colorValue: $colorValue, ')
          ..write('isDefault: $isDefault, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, type, iconCodePoint, colorValue, isDefault, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.iconCodePoint == this.iconCodePoint &&
          other.colorValue == this.colorValue &&
          other.isDefault == this.isDefault &&
          other.createdAt == this.createdAt);
}

class CategoryEntitiesCompanion extends UpdateCompanion<CategoryEntity> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> type;
  final Value<int> iconCodePoint;
  final Value<int> colorValue;
  final Value<bool> isDefault;
  final Value<DateTime> createdAt;
  const CategoryEntitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.iconCodePoint = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CategoryEntitiesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String type,
    required int iconCodePoint,
    required int colorValue,
    this.isDefault = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : name = Value(name),
        type = Value(type),
        iconCodePoint = Value(iconCodePoint),
        colorValue = Value(colorValue);
  static Insertable<CategoryEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<int>? iconCodePoint,
    Expression<int>? colorValue,
    Expression<bool>? isDefault,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (iconCodePoint != null) 'icon_code_point': iconCodePoint,
      if (colorValue != null) 'color_value': colorValue,
      if (isDefault != null) 'is_default': isDefault,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CategoryEntitiesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? type,
      Value<int>? iconCodePoint,
      Value<int>? colorValue,
      Value<bool>? isDefault,
      Value<DateTime>? createdAt}) {
    return CategoryEntitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      iconCodePoint: iconCodePoint ?? this.iconCodePoint,
      colorValue: colorValue ?? this.colorValue,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (iconCodePoint.present) {
      map['icon_code_point'] = Variable<int>(iconCodePoint.value);
    }
    if (colorValue.present) {
      map['color_value'] = Variable<int>(colorValue.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<bool>(isDefault.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('iconCodePoint: $iconCodePoint, ')
          ..write('colorValue: $colorValue, ')
          ..write('isDefault: $isDefault, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $RecurringTransactionEntitiesTable extends RecurringTransactionEntities
    with
        TableInfo<$RecurringTransactionEntitiesTable,
            RecurringTransactionEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecurringTransactionEntitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _amountInCentsMeta =
      const VerificationMeta('amountInCents');
  @override
  late final GeneratedColumn<int> amountInCents = GeneratedColumn<int>(
      'amount_in_cents', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES category_entities (id) ON DELETE SET NULL'));
  static const VerificationMeta _frequencyMeta =
      const VerificationMeta('frequency');
  @override
  late final GeneratedColumn<String> frequency = GeneratedColumn<String>(
      'frequency', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastGeneratedMeta =
      const VerificationMeta('lastGenerated');
  @override
  late final GeneratedColumn<DateTime> lastGenerated =
      GeneratedColumn<DateTime>('last_generated', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _nextDueDateMeta =
      const VerificationMeta('nextDueDate');
  @override
  late final GeneratedColumn<DateTime> nextDueDate = GeneratedColumn<DateTime>(
      'next_due_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        amountInCents,
        type,
        categoryId,
        frequency,
        startDate,
        endDate,
        lastGenerated,
        nextDueDate,
        note,
        isActive,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recurring_transaction_entities';
  @override
  VerificationContext validateIntegrity(
      Insertable<RecurringTransactionEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount_in_cents')) {
      context.handle(
          _amountInCentsMeta,
          amountInCents.isAcceptableOrUnknown(
              data['amount_in_cents']!, _amountInCentsMeta));
    } else if (isInserting) {
      context.missing(_amountInCentsMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('frequency')) {
      context.handle(_frequencyMeta,
          frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta));
    } else if (isInserting) {
      context.missing(_frequencyMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('last_generated')) {
      context.handle(
          _lastGeneratedMeta,
          lastGenerated.isAcceptableOrUnknown(
              data['last_generated']!, _lastGeneratedMeta));
    }
    if (data.containsKey('next_due_date')) {
      context.handle(
          _nextDueDateMeta,
          nextDueDate.isAcceptableOrUnknown(
              data['next_due_date']!, _nextDueDateMeta));
    } else if (isInserting) {
      context.missing(_nextDueDateMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecurringTransactionEntity map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecurringTransactionEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      amountInCents: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount_in_cents'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      frequency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}frequency'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
      lastGenerated: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_generated']),
      nextDueDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}next_due_date'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $RecurringTransactionEntitiesTable createAlias(String alias) {
    return $RecurringTransactionEntitiesTable(attachedDatabase, alias);
  }
}

class RecurringTransactionEntity extends DataClass
    implements Insertable<RecurringTransactionEntity> {
  final int id;
  final int amountInCents;
  final String type;
  final int categoryId;
  final String frequency;
  final DateTime startDate;
  final DateTime? endDate;
  final DateTime? lastGenerated;
  final DateTime nextDueDate;
  final String? note;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const RecurringTransactionEntity(
      {required this.id,
      required this.amountInCents,
      required this.type,
      required this.categoryId,
      required this.frequency,
      required this.startDate,
      this.endDate,
      this.lastGenerated,
      required this.nextDueDate,
      this.note,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount_in_cents'] = Variable<int>(amountInCents);
    map['type'] = Variable<String>(type);
    map['category_id'] = Variable<int>(categoryId);
    map['frequency'] = Variable<String>(frequency);
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || lastGenerated != null) {
      map['last_generated'] = Variable<DateTime>(lastGenerated);
    }
    map['next_due_date'] = Variable<DateTime>(nextDueDate);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  RecurringTransactionEntitiesCompanion toCompanion(bool nullToAbsent) {
    return RecurringTransactionEntitiesCompanion(
      id: Value(id),
      amountInCents: Value(amountInCents),
      type: Value(type),
      categoryId: Value(categoryId),
      frequency: Value(frequency),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      lastGenerated: lastGenerated == null && nullToAbsent
          ? const Value.absent()
          : Value(lastGenerated),
      nextDueDate: Value(nextDueDate),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory RecurringTransactionEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecurringTransactionEntity(
      id: serializer.fromJson<int>(json['id']),
      amountInCents: serializer.fromJson<int>(json['amountInCents']),
      type: serializer.fromJson<String>(json['type']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      frequency: serializer.fromJson<String>(json['frequency']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      lastGenerated: serializer.fromJson<DateTime?>(json['lastGenerated']),
      nextDueDate: serializer.fromJson<DateTime>(json['nextDueDate']),
      note: serializer.fromJson<String?>(json['note']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amountInCents': serializer.toJson<int>(amountInCents),
      'type': serializer.toJson<String>(type),
      'categoryId': serializer.toJson<int>(categoryId),
      'frequency': serializer.toJson<String>(frequency),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'lastGenerated': serializer.toJson<DateTime?>(lastGenerated),
      'nextDueDate': serializer.toJson<DateTime>(nextDueDate),
      'note': serializer.toJson<String?>(note),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  RecurringTransactionEntity copyWith(
          {int? id,
          int? amountInCents,
          String? type,
          int? categoryId,
          String? frequency,
          DateTime? startDate,
          Value<DateTime?> endDate = const Value.absent(),
          Value<DateTime?> lastGenerated = const Value.absent(),
          DateTime? nextDueDate,
          Value<String?> note = const Value.absent(),
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      RecurringTransactionEntity(
        id: id ?? this.id,
        amountInCents: amountInCents ?? this.amountInCents,
        type: type ?? this.type,
        categoryId: categoryId ?? this.categoryId,
        frequency: frequency ?? this.frequency,
        startDate: startDate ?? this.startDate,
        endDate: endDate.present ? endDate.value : this.endDate,
        lastGenerated:
            lastGenerated.present ? lastGenerated.value : this.lastGenerated,
        nextDueDate: nextDueDate ?? this.nextDueDate,
        note: note.present ? note.value : this.note,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  RecurringTransactionEntity copyWithCompanion(
      RecurringTransactionEntitiesCompanion data) {
    return RecurringTransactionEntity(
      id: data.id.present ? data.id.value : this.id,
      amountInCents: data.amountInCents.present
          ? data.amountInCents.value
          : this.amountInCents,
      type: data.type.present ? data.type.value : this.type,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      lastGenerated: data.lastGenerated.present
          ? data.lastGenerated.value
          : this.lastGenerated,
      nextDueDate:
          data.nextDueDate.present ? data.nextDueDate.value : this.nextDueDate,
      note: data.note.present ? data.note.value : this.note,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecurringTransactionEntity(')
          ..write('id: $id, ')
          ..write('amountInCents: $amountInCents, ')
          ..write('type: $type, ')
          ..write('categoryId: $categoryId, ')
          ..write('frequency: $frequency, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('lastGenerated: $lastGenerated, ')
          ..write('nextDueDate: $nextDueDate, ')
          ..write('note: $note, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      amountInCents,
      type,
      categoryId,
      frequency,
      startDate,
      endDate,
      lastGenerated,
      nextDueDate,
      note,
      isActive,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecurringTransactionEntity &&
          other.id == this.id &&
          other.amountInCents == this.amountInCents &&
          other.type == this.type &&
          other.categoryId == this.categoryId &&
          other.frequency == this.frequency &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.lastGenerated == this.lastGenerated &&
          other.nextDueDate == this.nextDueDate &&
          other.note == this.note &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RecurringTransactionEntitiesCompanion
    extends UpdateCompanion<RecurringTransactionEntity> {
  final Value<int> id;
  final Value<int> amountInCents;
  final Value<String> type;
  final Value<int> categoryId;
  final Value<String> frequency;
  final Value<DateTime> startDate;
  final Value<DateTime?> endDate;
  final Value<DateTime?> lastGenerated;
  final Value<DateTime> nextDueDate;
  final Value<String?> note;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const RecurringTransactionEntitiesCompanion({
    this.id = const Value.absent(),
    this.amountInCents = const Value.absent(),
    this.type = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.frequency = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.lastGenerated = const Value.absent(),
    this.nextDueDate = const Value.absent(),
    this.note = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  RecurringTransactionEntitiesCompanion.insert({
    this.id = const Value.absent(),
    required int amountInCents,
    required String type,
    required int categoryId,
    required String frequency,
    required DateTime startDate,
    this.endDate = const Value.absent(),
    this.lastGenerated = const Value.absent(),
    required DateTime nextDueDate,
    this.note = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : amountInCents = Value(amountInCents),
        type = Value(type),
        categoryId = Value(categoryId),
        frequency = Value(frequency),
        startDate = Value(startDate),
        nextDueDate = Value(nextDueDate);
  static Insertable<RecurringTransactionEntity> custom({
    Expression<int>? id,
    Expression<int>? amountInCents,
    Expression<String>? type,
    Expression<int>? categoryId,
    Expression<String>? frequency,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<DateTime>? lastGenerated,
    Expression<DateTime>? nextDueDate,
    Expression<String>? note,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amountInCents != null) 'amount_in_cents': amountInCents,
      if (type != null) 'type': type,
      if (categoryId != null) 'category_id': categoryId,
      if (frequency != null) 'frequency': frequency,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (lastGenerated != null) 'last_generated': lastGenerated,
      if (nextDueDate != null) 'next_due_date': nextDueDate,
      if (note != null) 'note': note,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  RecurringTransactionEntitiesCompanion copyWith(
      {Value<int>? id,
      Value<int>? amountInCents,
      Value<String>? type,
      Value<int>? categoryId,
      Value<String>? frequency,
      Value<DateTime>? startDate,
      Value<DateTime?>? endDate,
      Value<DateTime?>? lastGenerated,
      Value<DateTime>? nextDueDate,
      Value<String?>? note,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return RecurringTransactionEntitiesCompanion(
      id: id ?? this.id,
      amountInCents: amountInCents ?? this.amountInCents,
      type: type ?? this.type,
      categoryId: categoryId ?? this.categoryId,
      frequency: frequency ?? this.frequency,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      lastGenerated: lastGenerated ?? this.lastGenerated,
      nextDueDate: nextDueDate ?? this.nextDueDate,
      note: note ?? this.note,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amountInCents.present) {
      map['amount_in_cents'] = Variable<int>(amountInCents.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<String>(frequency.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (lastGenerated.present) {
      map['last_generated'] = Variable<DateTime>(lastGenerated.value);
    }
    if (nextDueDate.present) {
      map['next_due_date'] = Variable<DateTime>(nextDueDate.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecurringTransactionEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('amountInCents: $amountInCents, ')
          ..write('type: $type, ')
          ..write('categoryId: $categoryId, ')
          ..write('frequency: $frequency, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('lastGenerated: $lastGenerated, ')
          ..write('nextDueDate: $nextDueDate, ')
          ..write('note: $note, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TransactionEntitiesTable extends TransactionEntities
    with TableInfo<$TransactionEntitiesTable, TransactionEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionEntitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _amountInCentsMeta =
      const VerificationMeta('amountInCents');
  @override
  late final GeneratedColumn<int> amountInCents = GeneratedColumn<int>(
      'amount_in_cents', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _recurringTransactionIdMeta =
      const VerificationMeta('recurringTransactionId');
  @override
  late final GeneratedColumn<int> recurringTransactionId = GeneratedColumn<int>(
      'recurring_transaction_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES recurring_transaction_entities (id) ON DELETE SET NULL'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        amountInCents,
        type,
        category,
        date,
        note,
        createdAt,
        recurringTransactionId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_entities';
  @override
  VerificationContext validateIntegrity(Insertable<TransactionEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount_in_cents')) {
      context.handle(
          _amountInCentsMeta,
          amountInCents.isAcceptableOrUnknown(
              data['amount_in_cents']!, _amountInCentsMeta));
    } else if (isInserting) {
      context.missing(_amountInCentsMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('recurring_transaction_id')) {
      context.handle(
          _recurringTransactionIdMeta,
          recurringTransactionId.isAcceptableOrUnknown(
              data['recurring_transaction_id']!, _recurringTransactionIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      amountInCents: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount_in_cents'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      recurringTransactionId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}recurring_transaction_id']),
    );
  }

  @override
  $TransactionEntitiesTable createAlias(String alias) {
    return $TransactionEntitiesTable(attachedDatabase, alias);
  }
}

class TransactionEntity extends DataClass
    implements Insertable<TransactionEntity> {
  final int id;
  final int amountInCents;
  final String type;
  final String category;
  final DateTime date;
  final String? note;
  final DateTime createdAt;
  final int? recurringTransactionId;
  const TransactionEntity(
      {required this.id,
      required this.amountInCents,
      required this.type,
      required this.category,
      required this.date,
      this.note,
      required this.createdAt,
      this.recurringTransactionId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount_in_cents'] = Variable<int>(amountInCents);
    map['type'] = Variable<String>(type);
    map['category'] = Variable<String>(category);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || recurringTransactionId != null) {
      map['recurring_transaction_id'] = Variable<int>(recurringTransactionId);
    }
    return map;
  }

  TransactionEntitiesCompanion toCompanion(bool nullToAbsent) {
    return TransactionEntitiesCompanion(
      id: Value(id),
      amountInCents: Value(amountInCents),
      type: Value(type),
      category: Value(category),
      date: Value(date),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
      recurringTransactionId: recurringTransactionId == null && nullToAbsent
          ? const Value.absent()
          : Value(recurringTransactionId),
    );
  }

  factory TransactionEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionEntity(
      id: serializer.fromJson<int>(json['id']),
      amountInCents: serializer.fromJson<int>(json['amountInCents']),
      type: serializer.fromJson<String>(json['type']),
      category: serializer.fromJson<String>(json['category']),
      date: serializer.fromJson<DateTime>(json['date']),
      note: serializer.fromJson<String?>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      recurringTransactionId:
          serializer.fromJson<int?>(json['recurringTransactionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amountInCents': serializer.toJson<int>(amountInCents),
      'type': serializer.toJson<String>(type),
      'category': serializer.toJson<String>(category),
      'date': serializer.toJson<DateTime>(date),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'recurringTransactionId': serializer.toJson<int?>(recurringTransactionId),
    };
  }

  TransactionEntity copyWith(
          {int? id,
          int? amountInCents,
          String? type,
          String? category,
          DateTime? date,
          Value<String?> note = const Value.absent(),
          DateTime? createdAt,
          Value<int?> recurringTransactionId = const Value.absent()}) =>
      TransactionEntity(
        id: id ?? this.id,
        amountInCents: amountInCents ?? this.amountInCents,
        type: type ?? this.type,
        category: category ?? this.category,
        date: date ?? this.date,
        note: note.present ? note.value : this.note,
        createdAt: createdAt ?? this.createdAt,
        recurringTransactionId: recurringTransactionId.present
            ? recurringTransactionId.value
            : this.recurringTransactionId,
      );
  TransactionEntity copyWithCompanion(TransactionEntitiesCompanion data) {
    return TransactionEntity(
      id: data.id.present ? data.id.value : this.id,
      amountInCents: data.amountInCents.present
          ? data.amountInCents.value
          : this.amountInCents,
      type: data.type.present ? data.type.value : this.type,
      category: data.category.present ? data.category.value : this.category,
      date: data.date.present ? data.date.value : this.date,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      recurringTransactionId: data.recurringTransactionId.present
          ? data.recurringTransactionId.value
          : this.recurringTransactionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionEntity(')
          ..write('id: $id, ')
          ..write('amountInCents: $amountInCents, ')
          ..write('type: $type, ')
          ..write('category: $category, ')
          ..write('date: $date, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('recurringTransactionId: $recurringTransactionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, amountInCents, type, category, date, note,
      createdAt, recurringTransactionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionEntity &&
          other.id == this.id &&
          other.amountInCents == this.amountInCents &&
          other.type == this.type &&
          other.category == this.category &&
          other.date == this.date &&
          other.note == this.note &&
          other.createdAt == this.createdAt &&
          other.recurringTransactionId == this.recurringTransactionId);
}

class TransactionEntitiesCompanion extends UpdateCompanion<TransactionEntity> {
  final Value<int> id;
  final Value<int> amountInCents;
  final Value<String> type;
  final Value<String> category;
  final Value<DateTime> date;
  final Value<String?> note;
  final Value<DateTime> createdAt;
  final Value<int?> recurringTransactionId;
  const TransactionEntitiesCompanion({
    this.id = const Value.absent(),
    this.amountInCents = const Value.absent(),
    this.type = const Value.absent(),
    this.category = const Value.absent(),
    this.date = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.recurringTransactionId = const Value.absent(),
  });
  TransactionEntitiesCompanion.insert({
    this.id = const Value.absent(),
    required int amountInCents,
    required String type,
    required String category,
    required DateTime date,
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.recurringTransactionId = const Value.absent(),
  })  : amountInCents = Value(amountInCents),
        type = Value(type),
        category = Value(category),
        date = Value(date);
  static Insertable<TransactionEntity> custom({
    Expression<int>? id,
    Expression<int>? amountInCents,
    Expression<String>? type,
    Expression<String>? category,
    Expression<DateTime>? date,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
    Expression<int>? recurringTransactionId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amountInCents != null) 'amount_in_cents': amountInCents,
      if (type != null) 'type': type,
      if (category != null) 'category': category,
      if (date != null) 'date': date,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
      if (recurringTransactionId != null)
        'recurring_transaction_id': recurringTransactionId,
    });
  }

  TransactionEntitiesCompanion copyWith(
      {Value<int>? id,
      Value<int>? amountInCents,
      Value<String>? type,
      Value<String>? category,
      Value<DateTime>? date,
      Value<String?>? note,
      Value<DateTime>? createdAt,
      Value<int?>? recurringTransactionId}) {
    return TransactionEntitiesCompanion(
      id: id ?? this.id,
      amountInCents: amountInCents ?? this.amountInCents,
      type: type ?? this.type,
      category: category ?? this.category,
      date: date ?? this.date,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      recurringTransactionId:
          recurringTransactionId ?? this.recurringTransactionId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amountInCents.present) {
      map['amount_in_cents'] = Variable<int>(amountInCents.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (recurringTransactionId.present) {
      map['recurring_transaction_id'] =
          Variable<int>(recurringTransactionId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('amountInCents: $amountInCents, ')
          ..write('type: $type, ')
          ..write('category: $category, ')
          ..write('date: $date, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('recurringTransactionId: $recurringTransactionId')
          ..write(')'))
        .toString();
  }
}

class $BudgetEntitiesTable extends BudgetEntities
    with TableInfo<$BudgetEntitiesTable, BudgetEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BudgetEntitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES category_entities (id) ON DELETE CASCADE'));
  static const VerificationMeta _amountInCentsMeta =
      const VerificationMeta('amountInCents');
  @override
  late final GeneratedColumn<int> amountInCents = GeneratedColumn<int>(
      'amount_in_cents', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _monthMeta = const VerificationMeta('month');
  @override
  late final GeneratedColumn<int> month = GeneratedColumn<int>(
      'month', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
      'year', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, categoryId, amountInCents, month, year, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'budget_entities';
  @override
  VerificationContext validateIntegrity(Insertable<BudgetEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('amount_in_cents')) {
      context.handle(
          _amountInCentsMeta,
          amountInCents.isAcceptableOrUnknown(
              data['amount_in_cents']!, _amountInCentsMeta));
    } else if (isInserting) {
      context.missing(_amountInCentsMeta);
    }
    if (data.containsKey('month')) {
      context.handle(
          _monthMeta, month.isAcceptableOrUnknown(data['month']!, _monthMeta));
    } else if (isInserting) {
      context.missing(_monthMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {categoryId, month, year},
      ];
  @override
  BudgetEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BudgetEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      amountInCents: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount_in_cents'])!,
      month: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}month'])!,
      year: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}year'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $BudgetEntitiesTable createAlias(String alias) {
    return $BudgetEntitiesTable(attachedDatabase, alias);
  }
}

class BudgetEntity extends DataClass implements Insertable<BudgetEntity> {
  final int id;
  final int categoryId;
  final int amountInCents;
  final int month;
  final int year;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BudgetEntity(
      {required this.id,
      required this.categoryId,
      required this.amountInCents,
      required this.month,
      required this.year,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category_id'] = Variable<int>(categoryId);
    map['amount_in_cents'] = Variable<int>(amountInCents);
    map['month'] = Variable<int>(month);
    map['year'] = Variable<int>(year);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BudgetEntitiesCompanion toCompanion(bool nullToAbsent) {
    return BudgetEntitiesCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      amountInCents: Value(amountInCents),
      month: Value(month),
      year: Value(year),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory BudgetEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BudgetEntity(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      amountInCents: serializer.fromJson<int>(json['amountInCents']),
      month: serializer.fromJson<int>(json['month']),
      year: serializer.fromJson<int>(json['year']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryId': serializer.toJson<int>(categoryId),
      'amountInCents': serializer.toJson<int>(amountInCents),
      'month': serializer.toJson<int>(month),
      'year': serializer.toJson<int>(year),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BudgetEntity copyWith(
          {int? id,
          int? categoryId,
          int? amountInCents,
          int? month,
          int? year,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      BudgetEntity(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        amountInCents: amountInCents ?? this.amountInCents,
        month: month ?? this.month,
        year: year ?? this.year,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  BudgetEntity copyWithCompanion(BudgetEntitiesCompanion data) {
    return BudgetEntity(
      id: data.id.present ? data.id.value : this.id,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      amountInCents: data.amountInCents.present
          ? data.amountInCents.value
          : this.amountInCents,
      month: data.month.present ? data.month.value : this.month,
      year: data.year.present ? data.year.value : this.year,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BudgetEntity(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('amountInCents: $amountInCents, ')
          ..write('month: $month, ')
          ..write('year: $year, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, categoryId, amountInCents, month, year, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BudgetEntity &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.amountInCents == this.amountInCents &&
          other.month == this.month &&
          other.year == this.year &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BudgetEntitiesCompanion extends UpdateCompanion<BudgetEntity> {
  final Value<int> id;
  final Value<int> categoryId;
  final Value<int> amountInCents;
  final Value<int> month;
  final Value<int> year;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BudgetEntitiesCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.amountInCents = const Value.absent(),
    this.month = const Value.absent(),
    this.year = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BudgetEntitiesCompanion.insert({
    this.id = const Value.absent(),
    required int categoryId,
    required int amountInCents,
    required int month,
    required int year,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : categoryId = Value(categoryId),
        amountInCents = Value(amountInCents),
        month = Value(month),
        year = Value(year);
  static Insertable<BudgetEntity> custom({
    Expression<int>? id,
    Expression<int>? categoryId,
    Expression<int>? amountInCents,
    Expression<int>? month,
    Expression<int>? year,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (amountInCents != null) 'amount_in_cents': amountInCents,
      if (month != null) 'month': month,
      if (year != null) 'year': year,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BudgetEntitiesCompanion copyWith(
      {Value<int>? id,
      Value<int>? categoryId,
      Value<int>? amountInCents,
      Value<int>? month,
      Value<int>? year,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return BudgetEntitiesCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      amountInCents: amountInCents ?? this.amountInCents,
      month: month ?? this.month,
      year: year ?? this.year,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (amountInCents.present) {
      map['amount_in_cents'] = Variable<int>(amountInCents.value);
    }
    if (month.present) {
      map['month'] = Variable<int>(month.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BudgetEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('amountInCents: $amountInCents, ')
          ..write('month: $month, ')
          ..write('year: $year, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $InvestmentEntitiesTable extends InvestmentEntities
    with TableInfo<$InvestmentEntitiesTable, InvestmentEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvestmentEntitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _assetTypeMeta =
      const VerificationMeta('assetType');
  @override
  late final GeneratedColumn<String> assetType = GeneratedColumn<String>(
      'asset_type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _investedAmountMeta =
      const VerificationMeta('investedAmount');
  @override
  late final GeneratedColumn<int> investedAmount = GeneratedColumn<int>(
      'invested_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currentValueMeta =
      const VerificationMeta('currentValue');
  @override
  late final GeneratedColumn<int> currentValue = GeneratedColumn<int>(
      'current_value', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _investmentDateMeta =
      const VerificationMeta('investmentDate');
  @override
  late final GeneratedColumn<DateTime> investmentDate =
      GeneratedColumn<DateTime>('investment_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _maturityDateMeta =
      const VerificationMeta('maturityDate');
  @override
  late final GeneratedColumn<DateTime> maturityDate = GeneratedColumn<DateTime>(
      'maturity_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _isRecurringMeta =
      const VerificationMeta('isRecurring');
  @override
  late final GeneratedColumn<bool> isRecurring = GeneratedColumn<bool>(
      'is_recurring', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_recurring" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _recurringAmountMeta =
      const VerificationMeta('recurringAmount');
  @override
  late final GeneratedColumn<int> recurringAmount = GeneratedColumn<int>(
      'recurring_amount', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        assetType,
        investedAmount,
        currentValue,
        investmentDate,
        maturityDate,
        notes,
        isRecurring,
        recurringAmount,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'investment_entities';
  @override
  VerificationContext validateIntegrity(Insertable<InvestmentEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('asset_type')) {
      context.handle(_assetTypeMeta,
          assetType.isAcceptableOrUnknown(data['asset_type']!, _assetTypeMeta));
    } else if (isInserting) {
      context.missing(_assetTypeMeta);
    }
    if (data.containsKey('invested_amount')) {
      context.handle(
          _investedAmountMeta,
          investedAmount.isAcceptableOrUnknown(
              data['invested_amount']!, _investedAmountMeta));
    } else if (isInserting) {
      context.missing(_investedAmountMeta);
    }
    if (data.containsKey('current_value')) {
      context.handle(
          _currentValueMeta,
          currentValue.isAcceptableOrUnknown(
              data['current_value']!, _currentValueMeta));
    } else if (isInserting) {
      context.missing(_currentValueMeta);
    }
    if (data.containsKey('investment_date')) {
      context.handle(
          _investmentDateMeta,
          investmentDate.isAcceptableOrUnknown(
              data['investment_date']!, _investmentDateMeta));
    } else if (isInserting) {
      context.missing(_investmentDateMeta);
    }
    if (data.containsKey('maturity_date')) {
      context.handle(
          _maturityDateMeta,
          maturityDate.isAcceptableOrUnknown(
              data['maturity_date']!, _maturityDateMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('is_recurring')) {
      context.handle(
          _isRecurringMeta,
          isRecurring.isAcceptableOrUnknown(
              data['is_recurring']!, _isRecurringMeta));
    }
    if (data.containsKey('recurring_amount')) {
      context.handle(
          _recurringAmountMeta,
          recurringAmount.isAcceptableOrUnknown(
              data['recurring_amount']!, _recurringAmountMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InvestmentEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InvestmentEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      assetType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}asset_type'])!,
      investedAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}invested_amount'])!,
      currentValue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_value'])!,
      investmentDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}investment_date'])!,
      maturityDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}maturity_date']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      isRecurring: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_recurring'])!,
      recurringAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}recurring_amount']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $InvestmentEntitiesTable createAlias(String alias) {
    return $InvestmentEntitiesTable(attachedDatabase, alias);
  }
}

class InvestmentEntity extends DataClass
    implements Insertable<InvestmentEntity> {
  final int id;
  final String name;
  final String assetType;
  final int investedAmount;
  final int currentValue;
  final DateTime investmentDate;
  final DateTime? maturityDate;
  final String? notes;
  final bool isRecurring;
  final int? recurringAmount;
  final DateTime createdAt;
  final DateTime updatedAt;
  const InvestmentEntity(
      {required this.id,
      required this.name,
      required this.assetType,
      required this.investedAmount,
      required this.currentValue,
      required this.investmentDate,
      this.maturityDate,
      this.notes,
      required this.isRecurring,
      this.recurringAmount,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['asset_type'] = Variable<String>(assetType);
    map['invested_amount'] = Variable<int>(investedAmount);
    map['current_value'] = Variable<int>(currentValue);
    map['investment_date'] = Variable<DateTime>(investmentDate);
    if (!nullToAbsent || maturityDate != null) {
      map['maturity_date'] = Variable<DateTime>(maturityDate);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_recurring'] = Variable<bool>(isRecurring);
    if (!nullToAbsent || recurringAmount != null) {
      map['recurring_amount'] = Variable<int>(recurringAmount);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  InvestmentEntitiesCompanion toCompanion(bool nullToAbsent) {
    return InvestmentEntitiesCompanion(
      id: Value(id),
      name: Value(name),
      assetType: Value(assetType),
      investedAmount: Value(investedAmount),
      currentValue: Value(currentValue),
      investmentDate: Value(investmentDate),
      maturityDate: maturityDate == null && nullToAbsent
          ? const Value.absent()
          : Value(maturityDate),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      isRecurring: Value(isRecurring),
      recurringAmount: recurringAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(recurringAmount),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory InvestmentEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InvestmentEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      assetType: serializer.fromJson<String>(json['assetType']),
      investedAmount: serializer.fromJson<int>(json['investedAmount']),
      currentValue: serializer.fromJson<int>(json['currentValue']),
      investmentDate: serializer.fromJson<DateTime>(json['investmentDate']),
      maturityDate: serializer.fromJson<DateTime?>(json['maturityDate']),
      notes: serializer.fromJson<String?>(json['notes']),
      isRecurring: serializer.fromJson<bool>(json['isRecurring']),
      recurringAmount: serializer.fromJson<int?>(json['recurringAmount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'assetType': serializer.toJson<String>(assetType),
      'investedAmount': serializer.toJson<int>(investedAmount),
      'currentValue': serializer.toJson<int>(currentValue),
      'investmentDate': serializer.toJson<DateTime>(investmentDate),
      'maturityDate': serializer.toJson<DateTime?>(maturityDate),
      'notes': serializer.toJson<String?>(notes),
      'isRecurring': serializer.toJson<bool>(isRecurring),
      'recurringAmount': serializer.toJson<int?>(recurringAmount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  InvestmentEntity copyWith(
          {int? id,
          String? name,
          String? assetType,
          int? investedAmount,
          int? currentValue,
          DateTime? investmentDate,
          Value<DateTime?> maturityDate = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          bool? isRecurring,
          Value<int?> recurringAmount = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      InvestmentEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        assetType: assetType ?? this.assetType,
        investedAmount: investedAmount ?? this.investedAmount,
        currentValue: currentValue ?? this.currentValue,
        investmentDate: investmentDate ?? this.investmentDate,
        maturityDate:
            maturityDate.present ? maturityDate.value : this.maturityDate,
        notes: notes.present ? notes.value : this.notes,
        isRecurring: isRecurring ?? this.isRecurring,
        recurringAmount: recurringAmount.present
            ? recurringAmount.value
            : this.recurringAmount,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  InvestmentEntity copyWithCompanion(InvestmentEntitiesCompanion data) {
    return InvestmentEntity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      assetType: data.assetType.present ? data.assetType.value : this.assetType,
      investedAmount: data.investedAmount.present
          ? data.investedAmount.value
          : this.investedAmount,
      currentValue: data.currentValue.present
          ? data.currentValue.value
          : this.currentValue,
      investmentDate: data.investmentDate.present
          ? data.investmentDate.value
          : this.investmentDate,
      maturityDate: data.maturityDate.present
          ? data.maturityDate.value
          : this.maturityDate,
      notes: data.notes.present ? data.notes.value : this.notes,
      isRecurring:
          data.isRecurring.present ? data.isRecurring.value : this.isRecurring,
      recurringAmount: data.recurringAmount.present
          ? data.recurringAmount.value
          : this.recurringAmount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InvestmentEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('assetType: $assetType, ')
          ..write('investedAmount: $investedAmount, ')
          ..write('currentValue: $currentValue, ')
          ..write('investmentDate: $investmentDate, ')
          ..write('maturityDate: $maturityDate, ')
          ..write('notes: $notes, ')
          ..write('isRecurring: $isRecurring, ')
          ..write('recurringAmount: $recurringAmount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      assetType,
      investedAmount,
      currentValue,
      investmentDate,
      maturityDate,
      notes,
      isRecurring,
      recurringAmount,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InvestmentEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.assetType == this.assetType &&
          other.investedAmount == this.investedAmount &&
          other.currentValue == this.currentValue &&
          other.investmentDate == this.investmentDate &&
          other.maturityDate == this.maturityDate &&
          other.notes == this.notes &&
          other.isRecurring == this.isRecurring &&
          other.recurringAmount == this.recurringAmount &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class InvestmentEntitiesCompanion extends UpdateCompanion<InvestmentEntity> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> assetType;
  final Value<int> investedAmount;
  final Value<int> currentValue;
  final Value<DateTime> investmentDate;
  final Value<DateTime?> maturityDate;
  final Value<String?> notes;
  final Value<bool> isRecurring;
  final Value<int?> recurringAmount;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const InvestmentEntitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.assetType = const Value.absent(),
    this.investedAmount = const Value.absent(),
    this.currentValue = const Value.absent(),
    this.investmentDate = const Value.absent(),
    this.maturityDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.isRecurring = const Value.absent(),
    this.recurringAmount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  InvestmentEntitiesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String assetType,
    required int investedAmount,
    required int currentValue,
    required DateTime investmentDate,
    this.maturityDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.isRecurring = const Value.absent(),
    this.recurringAmount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        assetType = Value(assetType),
        investedAmount = Value(investedAmount),
        currentValue = Value(currentValue),
        investmentDate = Value(investmentDate);
  static Insertable<InvestmentEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? assetType,
    Expression<int>? investedAmount,
    Expression<int>? currentValue,
    Expression<DateTime>? investmentDate,
    Expression<DateTime>? maturityDate,
    Expression<String>? notes,
    Expression<bool>? isRecurring,
    Expression<int>? recurringAmount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (assetType != null) 'asset_type': assetType,
      if (investedAmount != null) 'invested_amount': investedAmount,
      if (currentValue != null) 'current_value': currentValue,
      if (investmentDate != null) 'investment_date': investmentDate,
      if (maturityDate != null) 'maturity_date': maturityDate,
      if (notes != null) 'notes': notes,
      if (isRecurring != null) 'is_recurring': isRecurring,
      if (recurringAmount != null) 'recurring_amount': recurringAmount,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  InvestmentEntitiesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? assetType,
      Value<int>? investedAmount,
      Value<int>? currentValue,
      Value<DateTime>? investmentDate,
      Value<DateTime?>? maturityDate,
      Value<String?>? notes,
      Value<bool>? isRecurring,
      Value<int?>? recurringAmount,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return InvestmentEntitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      assetType: assetType ?? this.assetType,
      investedAmount: investedAmount ?? this.investedAmount,
      currentValue: currentValue ?? this.currentValue,
      investmentDate: investmentDate ?? this.investmentDate,
      maturityDate: maturityDate ?? this.maturityDate,
      notes: notes ?? this.notes,
      isRecurring: isRecurring ?? this.isRecurring,
      recurringAmount: recurringAmount ?? this.recurringAmount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (assetType.present) {
      map['asset_type'] = Variable<String>(assetType.value);
    }
    if (investedAmount.present) {
      map['invested_amount'] = Variable<int>(investedAmount.value);
    }
    if (currentValue.present) {
      map['current_value'] = Variable<int>(currentValue.value);
    }
    if (investmentDate.present) {
      map['investment_date'] = Variable<DateTime>(investmentDate.value);
    }
    if (maturityDate.present) {
      map['maturity_date'] = Variable<DateTime>(maturityDate.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isRecurring.present) {
      map['is_recurring'] = Variable<bool>(isRecurring.value);
    }
    if (recurringAmount.present) {
      map['recurring_amount'] = Variable<int>(recurringAmount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvestmentEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('assetType: $assetType, ')
          ..write('investedAmount: $investedAmount, ')
          ..write('currentValue: $currentValue, ')
          ..write('investmentDate: $investmentDate, ')
          ..write('maturityDate: $maturityDate, ')
          ..write('notes: $notes, ')
          ..write('isRecurring: $isRecurring, ')
          ..write('recurringAmount: $recurringAmount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $GoalEntitiesTable extends GoalEntities
    with TableInfo<$GoalEntitiesTable, GoalEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalEntitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _targetAmountMeta =
      const VerificationMeta('targetAmount');
  @override
  late final GeneratedColumn<int> targetAmount = GeneratedColumn<int>(
      'target_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currentAmountMeta =
      const VerificationMeta('currentAmount');
  @override
  late final GeneratedColumn<int> currentAmount = GeneratedColumn<int>(
      'current_amount', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _targetDateMeta =
      const VerificationMeta('targetDate');
  @override
  late final GeneratedColumn<DateTime> targetDate = GeneratedColumn<DateTime>(
      'target_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _enableRemindersMeta =
      const VerificationMeta('enableReminders');
  @override
  late final GeneratedColumn<bool> enableReminders = GeneratedColumn<bool>(
      'enable_reminders', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("enable_reminders" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        targetAmount,
        currentAmount,
        targetDate,
        category,
        notes,
        enableReminders,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goal_entities';
  @override
  VerificationContext validateIntegrity(Insertable<GoalEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('target_amount')) {
      context.handle(
          _targetAmountMeta,
          targetAmount.isAcceptableOrUnknown(
              data['target_amount']!, _targetAmountMeta));
    } else if (isInserting) {
      context.missing(_targetAmountMeta);
    }
    if (data.containsKey('current_amount')) {
      context.handle(
          _currentAmountMeta,
          currentAmount.isAcceptableOrUnknown(
              data['current_amount']!, _currentAmountMeta));
    }
    if (data.containsKey('target_date')) {
      context.handle(
          _targetDateMeta,
          targetDate.isAcceptableOrUnknown(
              data['target_date']!, _targetDateMeta));
    } else if (isInserting) {
      context.missing(_targetDateMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('enable_reminders')) {
      context.handle(
          _enableRemindersMeta,
          enableReminders.isAcceptableOrUnknown(
              data['enable_reminders']!, _enableRemindersMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GoalEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoalEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      targetAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}target_amount'])!,
      currentAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_amount'])!,
      targetDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}target_date'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      enableReminders: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}enable_reminders'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $GoalEntitiesTable createAlias(String alias) {
    return $GoalEntitiesTable(attachedDatabase, alias);
  }
}

class GoalEntity extends DataClass implements Insertable<GoalEntity> {
  final int id;
  final String name;
  final int targetAmount;
  final int currentAmount;
  final DateTime targetDate;
  final String? category;
  final String? notes;
  final bool enableReminders;
  final DateTime createdAt;
  final DateTime updatedAt;
  const GoalEntity(
      {required this.id,
      required this.name,
      required this.targetAmount,
      required this.currentAmount,
      required this.targetDate,
      this.category,
      this.notes,
      required this.enableReminders,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['target_amount'] = Variable<int>(targetAmount);
    map['current_amount'] = Variable<int>(currentAmount);
    map['target_date'] = Variable<DateTime>(targetDate);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['enable_reminders'] = Variable<bool>(enableReminders);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  GoalEntitiesCompanion toCompanion(bool nullToAbsent) {
    return GoalEntitiesCompanion(
      id: Value(id),
      name: Value(name),
      targetAmount: Value(targetAmount),
      currentAmount: Value(currentAmount),
      targetDate: Value(targetDate),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      enableReminders: Value(enableReminders),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory GoalEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoalEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      targetAmount: serializer.fromJson<int>(json['targetAmount']),
      currentAmount: serializer.fromJson<int>(json['currentAmount']),
      targetDate: serializer.fromJson<DateTime>(json['targetDate']),
      category: serializer.fromJson<String?>(json['category']),
      notes: serializer.fromJson<String?>(json['notes']),
      enableReminders: serializer.fromJson<bool>(json['enableReminders']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'targetAmount': serializer.toJson<int>(targetAmount),
      'currentAmount': serializer.toJson<int>(currentAmount),
      'targetDate': serializer.toJson<DateTime>(targetDate),
      'category': serializer.toJson<String?>(category),
      'notes': serializer.toJson<String?>(notes),
      'enableReminders': serializer.toJson<bool>(enableReminders),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  GoalEntity copyWith(
          {int? id,
          String? name,
          int? targetAmount,
          int? currentAmount,
          DateTime? targetDate,
          Value<String?> category = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          bool? enableReminders,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      GoalEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        targetAmount: targetAmount ?? this.targetAmount,
        currentAmount: currentAmount ?? this.currentAmount,
        targetDate: targetDate ?? this.targetDate,
        category: category.present ? category.value : this.category,
        notes: notes.present ? notes.value : this.notes,
        enableReminders: enableReminders ?? this.enableReminders,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  GoalEntity copyWithCompanion(GoalEntitiesCompanion data) {
    return GoalEntity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      targetAmount: data.targetAmount.present
          ? data.targetAmount.value
          : this.targetAmount,
      currentAmount: data.currentAmount.present
          ? data.currentAmount.value
          : this.currentAmount,
      targetDate:
          data.targetDate.present ? data.targetDate.value : this.targetDate,
      category: data.category.present ? data.category.value : this.category,
      notes: data.notes.present ? data.notes.value : this.notes,
      enableReminders: data.enableReminders.present
          ? data.enableReminders.value
          : this.enableReminders,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GoalEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('targetAmount: $targetAmount, ')
          ..write('currentAmount: $currentAmount, ')
          ..write('targetDate: $targetDate, ')
          ..write('category: $category, ')
          ..write('notes: $notes, ')
          ..write('enableReminders: $enableReminders, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, targetAmount, currentAmount,
      targetDate, category, notes, enableReminders, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.targetAmount == this.targetAmount &&
          other.currentAmount == this.currentAmount &&
          other.targetDate == this.targetDate &&
          other.category == this.category &&
          other.notes == this.notes &&
          other.enableReminders == this.enableReminders &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class GoalEntitiesCompanion extends UpdateCompanion<GoalEntity> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> targetAmount;
  final Value<int> currentAmount;
  final Value<DateTime> targetDate;
  final Value<String?> category;
  final Value<String?> notes;
  final Value<bool> enableReminders;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const GoalEntitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.targetAmount = const Value.absent(),
    this.currentAmount = const Value.absent(),
    this.targetDate = const Value.absent(),
    this.category = const Value.absent(),
    this.notes = const Value.absent(),
    this.enableReminders = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  GoalEntitiesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int targetAmount,
    this.currentAmount = const Value.absent(),
    required DateTime targetDate,
    this.category = const Value.absent(),
    this.notes = const Value.absent(),
    this.enableReminders = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        targetAmount = Value(targetAmount),
        targetDate = Value(targetDate);
  static Insertable<GoalEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? targetAmount,
    Expression<int>? currentAmount,
    Expression<DateTime>? targetDate,
    Expression<String>? category,
    Expression<String>? notes,
    Expression<bool>? enableReminders,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (targetAmount != null) 'target_amount': targetAmount,
      if (currentAmount != null) 'current_amount': currentAmount,
      if (targetDate != null) 'target_date': targetDate,
      if (category != null) 'category': category,
      if (notes != null) 'notes': notes,
      if (enableReminders != null) 'enable_reminders': enableReminders,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  GoalEntitiesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? targetAmount,
      Value<int>? currentAmount,
      Value<DateTime>? targetDate,
      Value<String?>? category,
      Value<String?>? notes,
      Value<bool>? enableReminders,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return GoalEntitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      targetAmount: targetAmount ?? this.targetAmount,
      currentAmount: currentAmount ?? this.currentAmount,
      targetDate: targetDate ?? this.targetDate,
      category: category ?? this.category,
      notes: notes ?? this.notes,
      enableReminders: enableReminders ?? this.enableReminders,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (targetAmount.present) {
      map['target_amount'] = Variable<int>(targetAmount.value);
    }
    if (currentAmount.present) {
      map['current_amount'] = Variable<int>(currentAmount.value);
    }
    if (targetDate.present) {
      map['target_date'] = Variable<DateTime>(targetDate.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (enableReminders.present) {
      map['enable_reminders'] = Variable<bool>(enableReminders.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('targetAmount: $targetAmount, ')
          ..write('currentAmount: $currentAmount, ')
          ..write('targetDate: $targetDate, ')
          ..write('category: $category, ')
          ..write('notes: $notes, ')
          ..write('enableReminders: $enableReminders, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoryEntitiesTable categoryEntities =
      $CategoryEntitiesTable(this);
  late final $RecurringTransactionEntitiesTable recurringTransactionEntities =
      $RecurringTransactionEntitiesTable(this);
  late final $TransactionEntitiesTable transactionEntities =
      $TransactionEntitiesTable(this);
  late final $BudgetEntitiesTable budgetEntities = $BudgetEntitiesTable(this);
  late final $InvestmentEntitiesTable investmentEntities =
      $InvestmentEntitiesTable(this);
  late final $GoalEntitiesTable goalEntities = $GoalEntitiesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        categoryEntities,
        recurringTransactionEntities,
        transactionEntities,
        budgetEntities,
        investmentEntities,
        goalEntities
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('category_entities',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('recurring_transaction_entities',
                  kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('recurring_transaction_entities',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('transaction_entities', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('category_entities',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('budget_entities', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$CategoryEntitiesTableCreateCompanionBuilder
    = CategoryEntitiesCompanion Function({
  Value<int> id,
  required String name,
  required String type,
  required int iconCodePoint,
  required int colorValue,
  Value<bool> isDefault,
  Value<DateTime> createdAt,
});
typedef $$CategoryEntitiesTableUpdateCompanionBuilder
    = CategoryEntitiesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> type,
  Value<int> iconCodePoint,
  Value<int> colorValue,
  Value<bool> isDefault,
  Value<DateTime> createdAt,
});

final class $$CategoryEntitiesTableReferences extends BaseReferences<
    _$AppDatabase, $CategoryEntitiesTable, CategoryEntity> {
  $$CategoryEntitiesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RecurringTransactionEntitiesTable,
      List<RecurringTransactionEntity>> _recurringTransactionEntitiesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.recurringTransactionEntities,
          aliasName: $_aliasNameGenerator(db.categoryEntities.id,
              db.recurringTransactionEntities.categoryId));

  $$RecurringTransactionEntitiesTableProcessedTableManager
      get recurringTransactionEntitiesRefs {
    final manager = $$RecurringTransactionEntitiesTableTableManager(
            $_db, $_db.recurringTransactionEntities)
        .filter((f) => f.categoryId.id($_item.id));

    final cache = $_typedResult
        .readTableOrNull(_recurringTransactionEntitiesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$BudgetEntitiesTable, List<BudgetEntity>>
      _budgetEntitiesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.budgetEntities,
              aliasName: $_aliasNameGenerator(
                  db.categoryEntities.id, db.budgetEntities.categoryId));

  $$BudgetEntitiesTableProcessedTableManager get budgetEntitiesRefs {
    final manager = $$BudgetEntitiesTableTableManager($_db, $_db.budgetEntities)
        .filter((f) => f.categoryId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_budgetEntitiesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CategoryEntitiesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryEntitiesTable> {
  $$CategoryEntitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get iconCodePoint => $composableBuilder(
      column: $table.iconCodePoint, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get colorValue => $composableBuilder(
      column: $table.colorValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDefault => $composableBuilder(
      column: $table.isDefault, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> recurringTransactionEntitiesRefs(
      Expression<bool> Function(
              $$RecurringTransactionEntitiesTableFilterComposer f)
          f) {
    final $$RecurringTransactionEntitiesTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.recurringTransactionEntities,
            getReferencedColumn: (t) => t.categoryId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RecurringTransactionEntitiesTableFilterComposer(
                  $db: $db,
                  $table: $db.recurringTransactionEntities,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> budgetEntitiesRefs(
      Expression<bool> Function($$BudgetEntitiesTableFilterComposer f) f) {
    final $$BudgetEntitiesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.budgetEntities,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BudgetEntitiesTableFilterComposer(
              $db: $db,
              $table: $db.budgetEntities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoryEntitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryEntitiesTable> {
  $$CategoryEntitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get iconCodePoint => $composableBuilder(
      column: $table.iconCodePoint,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get colorValue => $composableBuilder(
      column: $table.colorValue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDefault => $composableBuilder(
      column: $table.isDefault, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$CategoryEntitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryEntitiesTable> {
  $$CategoryEntitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get iconCodePoint => $composableBuilder(
      column: $table.iconCodePoint, builder: (column) => column);

  GeneratedColumn<int> get colorValue => $composableBuilder(
      column: $table.colorValue, builder: (column) => column);

  GeneratedColumn<bool> get isDefault =>
      $composableBuilder(column: $table.isDefault, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> recurringTransactionEntitiesRefs<T extends Object>(
      Expression<T> Function(
              $$RecurringTransactionEntitiesTableAnnotationComposer a)
          f) {
    final $$RecurringTransactionEntitiesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.recurringTransactionEntities,
            getReferencedColumn: (t) => t.categoryId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RecurringTransactionEntitiesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.recurringTransactionEntities,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> budgetEntitiesRefs<T extends Object>(
      Expression<T> Function($$BudgetEntitiesTableAnnotationComposer a) f) {
    final $$BudgetEntitiesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.budgetEntities,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BudgetEntitiesTableAnnotationComposer(
              $db: $db,
              $table: $db.budgetEntities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoryEntitiesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoryEntitiesTable,
    CategoryEntity,
    $$CategoryEntitiesTableFilterComposer,
    $$CategoryEntitiesTableOrderingComposer,
    $$CategoryEntitiesTableAnnotationComposer,
    $$CategoryEntitiesTableCreateCompanionBuilder,
    $$CategoryEntitiesTableUpdateCompanionBuilder,
    (CategoryEntity, $$CategoryEntitiesTableReferences),
    CategoryEntity,
    PrefetchHooks Function(
        {bool recurringTransactionEntitiesRefs, bool budgetEntitiesRefs})> {
  $$CategoryEntitiesTableTableManager(
      _$AppDatabase db, $CategoryEntitiesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryEntitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryEntitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryEntitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<int> iconCodePoint = const Value.absent(),
            Value<int> colorValue = const Value.absent(),
            Value<bool> isDefault = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              CategoryEntitiesCompanion(
            id: id,
            name: name,
            type: type,
            iconCodePoint: iconCodePoint,
            colorValue: colorValue,
            isDefault: isDefault,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String type,
            required int iconCodePoint,
            required int colorValue,
            Value<bool> isDefault = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              CategoryEntitiesCompanion.insert(
            id: id,
            name: name,
            type: type,
            iconCodePoint: iconCodePoint,
            colorValue: colorValue,
            isDefault: isDefault,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CategoryEntitiesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {recurringTransactionEntitiesRefs = false,
              budgetEntitiesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (recurringTransactionEntitiesRefs)
                  db.recurringTransactionEntities,
                if (budgetEntitiesRefs) db.budgetEntities
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recurringTransactionEntitiesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CategoryEntitiesTableReferences
                            ._recurringTransactionEntitiesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoryEntitiesTableReferences(db, table, p0)
                                .recurringTransactionEntitiesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items),
                  if (budgetEntitiesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CategoryEntitiesTableReferences
                            ._budgetEntitiesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoryEntitiesTableReferences(db, table, p0)
                                .budgetEntitiesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CategoryEntitiesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoryEntitiesTable,
    CategoryEntity,
    $$CategoryEntitiesTableFilterComposer,
    $$CategoryEntitiesTableOrderingComposer,
    $$CategoryEntitiesTableAnnotationComposer,
    $$CategoryEntitiesTableCreateCompanionBuilder,
    $$CategoryEntitiesTableUpdateCompanionBuilder,
    (CategoryEntity, $$CategoryEntitiesTableReferences),
    CategoryEntity,
    PrefetchHooks Function(
        {bool recurringTransactionEntitiesRefs, bool budgetEntitiesRefs})>;
typedef $$RecurringTransactionEntitiesTableCreateCompanionBuilder
    = RecurringTransactionEntitiesCompanion Function({
  Value<int> id,
  required int amountInCents,
  required String type,
  required int categoryId,
  required String frequency,
  required DateTime startDate,
  Value<DateTime?> endDate,
  Value<DateTime?> lastGenerated,
  required DateTime nextDueDate,
  Value<String?> note,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$RecurringTransactionEntitiesTableUpdateCompanionBuilder
    = RecurringTransactionEntitiesCompanion Function({
  Value<int> id,
  Value<int> amountInCents,
  Value<String> type,
  Value<int> categoryId,
  Value<String> frequency,
  Value<DateTime> startDate,
  Value<DateTime?> endDate,
  Value<DateTime?> lastGenerated,
  Value<DateTime> nextDueDate,
  Value<String?> note,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$RecurringTransactionEntitiesTableReferences
    extends BaseReferences<_$AppDatabase, $RecurringTransactionEntitiesTable,
        RecurringTransactionEntity> {
  $$RecurringTransactionEntitiesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CategoryEntitiesTable _categoryIdTable(_$AppDatabase db) =>
      db.categoryEntities.createAlias($_aliasNameGenerator(
          db.recurringTransactionEntities.categoryId, db.categoryEntities.id));

  $$CategoryEntitiesTableProcessedTableManager? get categoryId {
    if ($_item.categoryId == null) return null;
    final manager =
        $$CategoryEntitiesTableTableManager($_db, $_db.categoryEntities)
            .filter((f) => f.id($_item.categoryId!));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TransactionEntitiesTable, List<TransactionEntity>>
      _transactionEntitiesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.transactionEntities,
              aliasName: $_aliasNameGenerator(
                  db.recurringTransactionEntities.id,
                  db.transactionEntities.recurringTransactionId));

  $$TransactionEntitiesTableProcessedTableManager get transactionEntitiesRefs {
    final manager =
        $$TransactionEntitiesTableTableManager($_db, $_db.transactionEntities)
            .filter((f) => f.recurringTransactionId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_transactionEntitiesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$RecurringTransactionEntitiesTableFilterComposer
    extends Composer<_$AppDatabase, $RecurringTransactionEntitiesTable> {
  $$RecurringTransactionEntitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amountInCents => $composableBuilder(
      column: $table.amountInCents, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get frequency => $composableBuilder(
      column: $table.frequency, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastGenerated => $composableBuilder(
      column: $table.lastGenerated, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get nextDueDate => $composableBuilder(
      column: $table.nextDueDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$CategoryEntitiesTableFilterComposer get categoryId {
    final $$CategoryEntitiesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoryEntities,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoryEntitiesTableFilterComposer(
              $db: $db,
              $table: $db.categoryEntities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> transactionEntitiesRefs(
      Expression<bool> Function($$TransactionEntitiesTableFilterComposer f) f) {
    final $$TransactionEntitiesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactionEntities,
        getReferencedColumn: (t) => t.recurringTransactionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionEntitiesTableFilterComposer(
              $db: $db,
              $table: $db.transactionEntities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RecurringTransactionEntitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $RecurringTransactionEntitiesTable> {
  $$RecurringTransactionEntitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amountInCents => $composableBuilder(
      column: $table.amountInCents,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get frequency => $composableBuilder(
      column: $table.frequency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastGenerated => $composableBuilder(
      column: $table.lastGenerated,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get nextDueDate => $composableBuilder(
      column: $table.nextDueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$CategoryEntitiesTableOrderingComposer get categoryId {
    final $$CategoryEntitiesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoryEntities,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoryEntitiesTableOrderingComposer(
              $db: $db,
              $table: $db.categoryEntities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RecurringTransactionEntitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecurringTransactionEntitiesTable> {
  $$RecurringTransactionEntitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amountInCents => $composableBuilder(
      column: $table.amountInCents, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<DateTime> get lastGenerated => $composableBuilder(
      column: $table.lastGenerated, builder: (column) => column);

  GeneratedColumn<DateTime> get nextDueDate => $composableBuilder(
      column: $table.nextDueDate, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$CategoryEntitiesTableAnnotationComposer get categoryId {
    final $$CategoryEntitiesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoryEntities,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoryEntitiesTableAnnotationComposer(
              $db: $db,
              $table: $db.categoryEntities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> transactionEntitiesRefs<T extends Object>(
      Expression<T> Function($$TransactionEntitiesTableAnnotationComposer a)
          f) {
    final $$TransactionEntitiesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.transactionEntities,
            getReferencedColumn: (t) => t.recurringTransactionId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TransactionEntitiesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.transactionEntities,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$RecurringTransactionEntitiesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecurringTransactionEntitiesTable,
    RecurringTransactionEntity,
    $$RecurringTransactionEntitiesTableFilterComposer,
    $$RecurringTransactionEntitiesTableOrderingComposer,
    $$RecurringTransactionEntitiesTableAnnotationComposer,
    $$RecurringTransactionEntitiesTableCreateCompanionBuilder,
    $$RecurringTransactionEntitiesTableUpdateCompanionBuilder,
    (RecurringTransactionEntity, $$RecurringTransactionEntitiesTableReferences),
    RecurringTransactionEntity,
    PrefetchHooks Function({bool categoryId, bool transactionEntitiesRefs})> {
  $$RecurringTransactionEntitiesTableTableManager(
      _$AppDatabase db, $RecurringTransactionEntitiesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecurringTransactionEntitiesTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$RecurringTransactionEntitiesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecurringTransactionEntitiesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> amountInCents = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
            Value<String> frequency = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<DateTime?> lastGenerated = const Value.absent(),
            Value<DateTime> nextDueDate = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              RecurringTransactionEntitiesCompanion(
            id: id,
            amountInCents: amountInCents,
            type: type,
            categoryId: categoryId,
            frequency: frequency,
            startDate: startDate,
            endDate: endDate,
            lastGenerated: lastGenerated,
            nextDueDate: nextDueDate,
            note: note,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int amountInCents,
            required String type,
            required int categoryId,
            required String frequency,
            required DateTime startDate,
            Value<DateTime?> endDate = const Value.absent(),
            Value<DateTime?> lastGenerated = const Value.absent(),
            required DateTime nextDueDate,
            Value<String?> note = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              RecurringTransactionEntitiesCompanion.insert(
            id: id,
            amountInCents: amountInCents,
            type: type,
            categoryId: categoryId,
            frequency: frequency,
            startDate: startDate,
            endDate: endDate,
            lastGenerated: lastGenerated,
            nextDueDate: nextDueDate,
            note: note,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RecurringTransactionEntitiesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {categoryId = false, transactionEntitiesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (transactionEntitiesRefs) db.transactionEntities
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$RecurringTransactionEntitiesTableReferences
                            ._categoryIdTable(db),
                    referencedColumn:
                        $$RecurringTransactionEntitiesTableReferences
                            ._categoryIdTable(db)
                            .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionEntitiesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$RecurringTransactionEntitiesTableReferences
                                ._transactionEntitiesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RecurringTransactionEntitiesTableReferences(
                                    db, table, p0)
                                .transactionEntitiesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.recurringTransactionId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$RecurringTransactionEntitiesTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $RecurringTransactionEntitiesTable,
        RecurringTransactionEntity,
        $$RecurringTransactionEntitiesTableFilterComposer,
        $$RecurringTransactionEntitiesTableOrderingComposer,
        $$RecurringTransactionEntitiesTableAnnotationComposer,
        $$RecurringTransactionEntitiesTableCreateCompanionBuilder,
        $$RecurringTransactionEntitiesTableUpdateCompanionBuilder,
        (
          RecurringTransactionEntity,
          $$RecurringTransactionEntitiesTableReferences
        ),
        RecurringTransactionEntity,
        PrefetchHooks Function(
            {bool categoryId, bool transactionEntitiesRefs})>;
typedef $$TransactionEntitiesTableCreateCompanionBuilder
    = TransactionEntitiesCompanion Function({
  Value<int> id,
  required int amountInCents,
  required String type,
  required String category,
  required DateTime date,
  Value<String?> note,
  Value<DateTime> createdAt,
  Value<int?> recurringTransactionId,
});
typedef $$TransactionEntitiesTableUpdateCompanionBuilder
    = TransactionEntitiesCompanion Function({
  Value<int> id,
  Value<int> amountInCents,
  Value<String> type,
  Value<String> category,
  Value<DateTime> date,
  Value<String?> note,
  Value<DateTime> createdAt,
  Value<int?> recurringTransactionId,
});

final class $$TransactionEntitiesTableReferences extends BaseReferences<
    _$AppDatabase, $TransactionEntitiesTable, TransactionEntity> {
  $$TransactionEntitiesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $RecurringTransactionEntitiesTable _recurringTransactionIdTable(
          _$AppDatabase db) =>
      db.recurringTransactionEntities.createAlias($_aliasNameGenerator(
          db.transactionEntities.recurringTransactionId,
          db.recurringTransactionEntities.id));

  $$RecurringTransactionEntitiesTableProcessedTableManager?
      get recurringTransactionId {
    if ($_item.recurringTransactionId == null) return null;
    final manager = $$RecurringTransactionEntitiesTableTableManager(
            $_db, $_db.recurringTransactionEntities)
        .filter((f) => f.id($_item.recurringTransactionId!));
    final item =
        $_typedResult.readTableOrNull(_recurringTransactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TransactionEntitiesTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionEntitiesTable> {
  $$TransactionEntitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amountInCents => $composableBuilder(
      column: $table.amountInCents, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$RecurringTransactionEntitiesTableFilterComposer get recurringTransactionId {
    final $$RecurringTransactionEntitiesTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.recurringTransactionId,
            referencedTable: $db.recurringTransactionEntities,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RecurringTransactionEntitiesTableFilterComposer(
                  $db: $db,
                  $table: $db.recurringTransactionEntities,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$TransactionEntitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionEntitiesTable> {
  $$TransactionEntitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amountInCents => $composableBuilder(
      column: $table.amountInCents,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$RecurringTransactionEntitiesTableOrderingComposer
      get recurringTransactionId {
    final $$RecurringTransactionEntitiesTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.recurringTransactionId,
            referencedTable: $db.recurringTransactionEntities,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RecurringTransactionEntitiesTableOrderingComposer(
                  $db: $db,
                  $table: $db.recurringTransactionEntities,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$TransactionEntitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionEntitiesTable> {
  $$TransactionEntitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amountInCents => $composableBuilder(
      column: $table.amountInCents, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$RecurringTransactionEntitiesTableAnnotationComposer
      get recurringTransactionId {
    final $$RecurringTransactionEntitiesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.recurringTransactionId,
            referencedTable: $db.recurringTransactionEntities,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RecurringTransactionEntitiesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.recurringTransactionEntities,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$TransactionEntitiesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionEntitiesTable,
    TransactionEntity,
    $$TransactionEntitiesTableFilterComposer,
    $$TransactionEntitiesTableOrderingComposer,
    $$TransactionEntitiesTableAnnotationComposer,
    $$TransactionEntitiesTableCreateCompanionBuilder,
    $$TransactionEntitiesTableUpdateCompanionBuilder,
    (TransactionEntity, $$TransactionEntitiesTableReferences),
    TransactionEntity,
    PrefetchHooks Function({bool recurringTransactionId})> {
  $$TransactionEntitiesTableTableManager(
      _$AppDatabase db, $TransactionEntitiesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionEntitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionEntitiesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionEntitiesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> amountInCents = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int?> recurringTransactionId = const Value.absent(),
          }) =>
              TransactionEntitiesCompanion(
            id: id,
            amountInCents: amountInCents,
            type: type,
            category: category,
            date: date,
            note: note,
            createdAt: createdAt,
            recurringTransactionId: recurringTransactionId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int amountInCents,
            required String type,
            required String category,
            required DateTime date,
            Value<String?> note = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int?> recurringTransactionId = const Value.absent(),
          }) =>
              TransactionEntitiesCompanion.insert(
            id: id,
            amountInCents: amountInCents,
            type: type,
            category: category,
            date: date,
            note: note,
            createdAt: createdAt,
            recurringTransactionId: recurringTransactionId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TransactionEntitiesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({recurringTransactionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (recurringTransactionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.recurringTransactionId,
                    referencedTable: $$TransactionEntitiesTableReferences
                        ._recurringTransactionIdTable(db),
                    referencedColumn: $$TransactionEntitiesTableReferences
                        ._recurringTransactionIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TransactionEntitiesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TransactionEntitiesTable,
    TransactionEntity,
    $$TransactionEntitiesTableFilterComposer,
    $$TransactionEntitiesTableOrderingComposer,
    $$TransactionEntitiesTableAnnotationComposer,
    $$TransactionEntitiesTableCreateCompanionBuilder,
    $$TransactionEntitiesTableUpdateCompanionBuilder,
    (TransactionEntity, $$TransactionEntitiesTableReferences),
    TransactionEntity,
    PrefetchHooks Function({bool recurringTransactionId})>;
typedef $$BudgetEntitiesTableCreateCompanionBuilder = BudgetEntitiesCompanion
    Function({
  Value<int> id,
  required int categoryId,
  required int amountInCents,
  required int month,
  required int year,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$BudgetEntitiesTableUpdateCompanionBuilder = BudgetEntitiesCompanion
    Function({
  Value<int> id,
  Value<int> categoryId,
  Value<int> amountInCents,
  Value<int> month,
  Value<int> year,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$BudgetEntitiesTableReferences
    extends BaseReferences<_$AppDatabase, $BudgetEntitiesTable, BudgetEntity> {
  $$BudgetEntitiesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CategoryEntitiesTable _categoryIdTable(_$AppDatabase db) =>
      db.categoryEntities.createAlias($_aliasNameGenerator(
          db.budgetEntities.categoryId, db.categoryEntities.id));

  $$CategoryEntitiesTableProcessedTableManager? get categoryId {
    if ($_item.categoryId == null) return null;
    final manager =
        $$CategoryEntitiesTableTableManager($_db, $_db.categoryEntities)
            .filter((f) => f.id($_item.categoryId!));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$BudgetEntitiesTableFilterComposer
    extends Composer<_$AppDatabase, $BudgetEntitiesTable> {
  $$BudgetEntitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amountInCents => $composableBuilder(
      column: $table.amountInCents, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get month => $composableBuilder(
      column: $table.month, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get year => $composableBuilder(
      column: $table.year, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$CategoryEntitiesTableFilterComposer get categoryId {
    final $$CategoryEntitiesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoryEntities,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoryEntitiesTableFilterComposer(
              $db: $db,
              $table: $db.categoryEntities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BudgetEntitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $BudgetEntitiesTable> {
  $$BudgetEntitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amountInCents => $composableBuilder(
      column: $table.amountInCents,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get month => $composableBuilder(
      column: $table.month, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get year => $composableBuilder(
      column: $table.year, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$CategoryEntitiesTableOrderingComposer get categoryId {
    final $$CategoryEntitiesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoryEntities,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoryEntitiesTableOrderingComposer(
              $db: $db,
              $table: $db.categoryEntities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BudgetEntitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BudgetEntitiesTable> {
  $$BudgetEntitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amountInCents => $composableBuilder(
      column: $table.amountInCents, builder: (column) => column);

  GeneratedColumn<int> get month =>
      $composableBuilder(column: $table.month, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$CategoryEntitiesTableAnnotationComposer get categoryId {
    final $$CategoryEntitiesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoryEntities,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoryEntitiesTableAnnotationComposer(
              $db: $db,
              $table: $db.categoryEntities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BudgetEntitiesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BudgetEntitiesTable,
    BudgetEntity,
    $$BudgetEntitiesTableFilterComposer,
    $$BudgetEntitiesTableOrderingComposer,
    $$BudgetEntitiesTableAnnotationComposer,
    $$BudgetEntitiesTableCreateCompanionBuilder,
    $$BudgetEntitiesTableUpdateCompanionBuilder,
    (BudgetEntity, $$BudgetEntitiesTableReferences),
    BudgetEntity,
    PrefetchHooks Function({bool categoryId})> {
  $$BudgetEntitiesTableTableManager(
      _$AppDatabase db, $BudgetEntitiesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BudgetEntitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BudgetEntitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BudgetEntitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
            Value<int> amountInCents = const Value.absent(),
            Value<int> month = const Value.absent(),
            Value<int> year = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              BudgetEntitiesCompanion(
            id: id,
            categoryId: categoryId,
            amountInCents: amountInCents,
            month: month,
            year: year,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int categoryId,
            required int amountInCents,
            required int month,
            required int year,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              BudgetEntitiesCompanion.insert(
            id: id,
            categoryId: categoryId,
            amountInCents: amountInCents,
            month: month,
            year: year,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BudgetEntitiesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$BudgetEntitiesTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$BudgetEntitiesTableReferences._categoryIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$BudgetEntitiesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BudgetEntitiesTable,
    BudgetEntity,
    $$BudgetEntitiesTableFilterComposer,
    $$BudgetEntitiesTableOrderingComposer,
    $$BudgetEntitiesTableAnnotationComposer,
    $$BudgetEntitiesTableCreateCompanionBuilder,
    $$BudgetEntitiesTableUpdateCompanionBuilder,
    (BudgetEntity, $$BudgetEntitiesTableReferences),
    BudgetEntity,
    PrefetchHooks Function({bool categoryId})>;
typedef $$InvestmentEntitiesTableCreateCompanionBuilder
    = InvestmentEntitiesCompanion Function({
  Value<int> id,
  required String name,
  required String assetType,
  required int investedAmount,
  required int currentValue,
  required DateTime investmentDate,
  Value<DateTime?> maturityDate,
  Value<String?> notes,
  Value<bool> isRecurring,
  Value<int?> recurringAmount,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$InvestmentEntitiesTableUpdateCompanionBuilder
    = InvestmentEntitiesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> assetType,
  Value<int> investedAmount,
  Value<int> currentValue,
  Value<DateTime> investmentDate,
  Value<DateTime?> maturityDate,
  Value<String?> notes,
  Value<bool> isRecurring,
  Value<int?> recurringAmount,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$InvestmentEntitiesTableFilterComposer
    extends Composer<_$AppDatabase, $InvestmentEntitiesTable> {
  $$InvestmentEntitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assetType => $composableBuilder(
      column: $table.assetType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get investedAmount => $composableBuilder(
      column: $table.investedAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentValue => $composableBuilder(
      column: $table.currentValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get investmentDate => $composableBuilder(
      column: $table.investmentDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get maturityDate => $composableBuilder(
      column: $table.maturityDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isRecurring => $composableBuilder(
      column: $table.isRecurring, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get recurringAmount => $composableBuilder(
      column: $table.recurringAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$InvestmentEntitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $InvestmentEntitiesTable> {
  $$InvestmentEntitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assetType => $composableBuilder(
      column: $table.assetType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get investedAmount => $composableBuilder(
      column: $table.investedAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentValue => $composableBuilder(
      column: $table.currentValue,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get investmentDate => $composableBuilder(
      column: $table.investmentDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get maturityDate => $composableBuilder(
      column: $table.maturityDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isRecurring => $composableBuilder(
      column: $table.isRecurring, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get recurringAmount => $composableBuilder(
      column: $table.recurringAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$InvestmentEntitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvestmentEntitiesTable> {
  $$InvestmentEntitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get assetType =>
      $composableBuilder(column: $table.assetType, builder: (column) => column);

  GeneratedColumn<int> get investedAmount => $composableBuilder(
      column: $table.investedAmount, builder: (column) => column);

  GeneratedColumn<int> get currentValue => $composableBuilder(
      column: $table.currentValue, builder: (column) => column);

  GeneratedColumn<DateTime> get investmentDate => $composableBuilder(
      column: $table.investmentDate, builder: (column) => column);

  GeneratedColumn<DateTime> get maturityDate => $composableBuilder(
      column: $table.maturityDate, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isRecurring => $composableBuilder(
      column: $table.isRecurring, builder: (column) => column);

  GeneratedColumn<int> get recurringAmount => $composableBuilder(
      column: $table.recurringAmount, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$InvestmentEntitiesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $InvestmentEntitiesTable,
    InvestmentEntity,
    $$InvestmentEntitiesTableFilterComposer,
    $$InvestmentEntitiesTableOrderingComposer,
    $$InvestmentEntitiesTableAnnotationComposer,
    $$InvestmentEntitiesTableCreateCompanionBuilder,
    $$InvestmentEntitiesTableUpdateCompanionBuilder,
    (
      InvestmentEntity,
      BaseReferences<_$AppDatabase, $InvestmentEntitiesTable, InvestmentEntity>
    ),
    InvestmentEntity,
    PrefetchHooks Function()> {
  $$InvestmentEntitiesTableTableManager(
      _$AppDatabase db, $InvestmentEntitiesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvestmentEntitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvestmentEntitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvestmentEntitiesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> assetType = const Value.absent(),
            Value<int> investedAmount = const Value.absent(),
            Value<int> currentValue = const Value.absent(),
            Value<DateTime> investmentDate = const Value.absent(),
            Value<DateTime?> maturityDate = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isRecurring = const Value.absent(),
            Value<int?> recurringAmount = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              InvestmentEntitiesCompanion(
            id: id,
            name: name,
            assetType: assetType,
            investedAmount: investedAmount,
            currentValue: currentValue,
            investmentDate: investmentDate,
            maturityDate: maturityDate,
            notes: notes,
            isRecurring: isRecurring,
            recurringAmount: recurringAmount,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String assetType,
            required int investedAmount,
            required int currentValue,
            required DateTime investmentDate,
            Value<DateTime?> maturityDate = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isRecurring = const Value.absent(),
            Value<int?> recurringAmount = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              InvestmentEntitiesCompanion.insert(
            id: id,
            name: name,
            assetType: assetType,
            investedAmount: investedAmount,
            currentValue: currentValue,
            investmentDate: investmentDate,
            maturityDate: maturityDate,
            notes: notes,
            isRecurring: isRecurring,
            recurringAmount: recurringAmount,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$InvestmentEntitiesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $InvestmentEntitiesTable,
    InvestmentEntity,
    $$InvestmentEntitiesTableFilterComposer,
    $$InvestmentEntitiesTableOrderingComposer,
    $$InvestmentEntitiesTableAnnotationComposer,
    $$InvestmentEntitiesTableCreateCompanionBuilder,
    $$InvestmentEntitiesTableUpdateCompanionBuilder,
    (
      InvestmentEntity,
      BaseReferences<_$AppDatabase, $InvestmentEntitiesTable, InvestmentEntity>
    ),
    InvestmentEntity,
    PrefetchHooks Function()>;
typedef $$GoalEntitiesTableCreateCompanionBuilder = GoalEntitiesCompanion
    Function({
  Value<int> id,
  required String name,
  required int targetAmount,
  Value<int> currentAmount,
  required DateTime targetDate,
  Value<String?> category,
  Value<String?> notes,
  Value<bool> enableReminders,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$GoalEntitiesTableUpdateCompanionBuilder = GoalEntitiesCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<int> targetAmount,
  Value<int> currentAmount,
  Value<DateTime> targetDate,
  Value<String?> category,
  Value<String?> notes,
  Value<bool> enableReminders,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$GoalEntitiesTableFilterComposer
    extends Composer<_$AppDatabase, $GoalEntitiesTable> {
  $$GoalEntitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get targetAmount => $composableBuilder(
      column: $table.targetAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentAmount => $composableBuilder(
      column: $table.currentAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get targetDate => $composableBuilder(
      column: $table.targetDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get enableReminders => $composableBuilder(
      column: $table.enableReminders,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$GoalEntitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalEntitiesTable> {
  $$GoalEntitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get targetAmount => $composableBuilder(
      column: $table.targetAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentAmount => $composableBuilder(
      column: $table.currentAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get targetDate => $composableBuilder(
      column: $table.targetDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get enableReminders => $composableBuilder(
      column: $table.enableReminders,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$GoalEntitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalEntitiesTable> {
  $$GoalEntitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get targetAmount => $composableBuilder(
      column: $table.targetAmount, builder: (column) => column);

  GeneratedColumn<int> get currentAmount => $composableBuilder(
      column: $table.currentAmount, builder: (column) => column);

  GeneratedColumn<DateTime> get targetDate => $composableBuilder(
      column: $table.targetDate, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get enableReminders => $composableBuilder(
      column: $table.enableReminders, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$GoalEntitiesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GoalEntitiesTable,
    GoalEntity,
    $$GoalEntitiesTableFilterComposer,
    $$GoalEntitiesTableOrderingComposer,
    $$GoalEntitiesTableAnnotationComposer,
    $$GoalEntitiesTableCreateCompanionBuilder,
    $$GoalEntitiesTableUpdateCompanionBuilder,
    (GoalEntity, BaseReferences<_$AppDatabase, $GoalEntitiesTable, GoalEntity>),
    GoalEntity,
    PrefetchHooks Function()> {
  $$GoalEntitiesTableTableManager(_$AppDatabase db, $GoalEntitiesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalEntitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalEntitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalEntitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> targetAmount = const Value.absent(),
            Value<int> currentAmount = const Value.absent(),
            Value<DateTime> targetDate = const Value.absent(),
            Value<String?> category = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> enableReminders = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              GoalEntitiesCompanion(
            id: id,
            name: name,
            targetAmount: targetAmount,
            currentAmount: currentAmount,
            targetDate: targetDate,
            category: category,
            notes: notes,
            enableReminders: enableReminders,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int targetAmount,
            Value<int> currentAmount = const Value.absent(),
            required DateTime targetDate,
            Value<String?> category = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> enableReminders = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              GoalEntitiesCompanion.insert(
            id: id,
            name: name,
            targetAmount: targetAmount,
            currentAmount: currentAmount,
            targetDate: targetDate,
            category: category,
            notes: notes,
            enableReminders: enableReminders,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GoalEntitiesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GoalEntitiesTable,
    GoalEntity,
    $$GoalEntitiesTableFilterComposer,
    $$GoalEntitiesTableOrderingComposer,
    $$GoalEntitiesTableAnnotationComposer,
    $$GoalEntitiesTableCreateCompanionBuilder,
    $$GoalEntitiesTableUpdateCompanionBuilder,
    (GoalEntity, BaseReferences<_$AppDatabase, $GoalEntitiesTable, GoalEntity>),
    GoalEntity,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoryEntitiesTableTableManager get categoryEntities =>
      $$CategoryEntitiesTableTableManager(_db, _db.categoryEntities);
  $$RecurringTransactionEntitiesTableTableManager
      get recurringTransactionEntities =>
          $$RecurringTransactionEntitiesTableTableManager(
              _db, _db.recurringTransactionEntities);
  $$TransactionEntitiesTableTableManager get transactionEntities =>
      $$TransactionEntitiesTableTableManager(_db, _db.transactionEntities);
  $$BudgetEntitiesTableTableManager get budgetEntities =>
      $$BudgetEntitiesTableTableManager(_db, _db.budgetEntities);
  $$InvestmentEntitiesTableTableManager get investmentEntities =>
      $$InvestmentEntitiesTableTableManager(_db, _db.investmentEntities);
  $$GoalEntitiesTableTableManager get goalEntities =>
      $$GoalEntitiesTableTableManager(_db, _db.goalEntities);
}
