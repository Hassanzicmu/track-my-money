// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recurring_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecurringTransaction _$RecurringTransactionFromJson(Map<String, dynamic> json) {
  return _RecurringTransaction.fromJson(json);
}

/// @nodoc
mixin _$RecurringTransaction {
  int get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // 'income' or 'expense'
  int get categoryId => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;
  RecurrenceFrequency get frequency => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  DateTime? get lastGenerated => throw _privateConstructorUsedError;
  DateTime get nextDueDate => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecurringTransactionCopyWith<RecurringTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecurringTransactionCopyWith<$Res> {
  factory $RecurringTransactionCopyWith(RecurringTransaction value,
          $Res Function(RecurringTransaction) then) =
      _$RecurringTransactionCopyWithImpl<$Res, RecurringTransaction>;
  @useResult
  $Res call(
      {int id,
      double amount,
      String type,
      int categoryId,
      String categoryName,
      RecurrenceFrequency frequency,
      DateTime startDate,
      DateTime? endDate,
      DateTime? lastGenerated,
      DateTime nextDueDate,
      String? note,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$RecurringTransactionCopyWithImpl<$Res,
        $Val extends RecurringTransaction>
    implements $RecurringTransactionCopyWith<$Res> {
  _$RecurringTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? type = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? frequency = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? lastGenerated = freezed,
    Object? nextDueDate = null,
    Object? note = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as RecurrenceFrequency,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastGenerated: freezed == lastGenerated
          ? _value.lastGenerated
          : lastGenerated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextDueDate: null == nextDueDate
          ? _value.nextDueDate
          : nextDueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecurringTransactionImplCopyWith<$Res>
    implements $RecurringTransactionCopyWith<$Res> {
  factory _$$RecurringTransactionImplCopyWith(_$RecurringTransactionImpl value,
          $Res Function(_$RecurringTransactionImpl) then) =
      __$$RecurringTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      double amount,
      String type,
      int categoryId,
      String categoryName,
      RecurrenceFrequency frequency,
      DateTime startDate,
      DateTime? endDate,
      DateTime? lastGenerated,
      DateTime nextDueDate,
      String? note,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$RecurringTransactionImplCopyWithImpl<$Res>
    extends _$RecurringTransactionCopyWithImpl<$Res, _$RecurringTransactionImpl>
    implements _$$RecurringTransactionImplCopyWith<$Res> {
  __$$RecurringTransactionImplCopyWithImpl(_$RecurringTransactionImpl _value,
      $Res Function(_$RecurringTransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? type = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? frequency = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? lastGenerated = freezed,
    Object? nextDueDate = null,
    Object? note = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$RecurringTransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as RecurrenceFrequency,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastGenerated: freezed == lastGenerated
          ? _value.lastGenerated
          : lastGenerated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextDueDate: null == nextDueDate
          ? _value.nextDueDate
          : nextDueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecurringTransactionImpl implements _RecurringTransaction {
  const _$RecurringTransactionImpl(
      {required this.id,
      required this.amount,
      required this.type,
      required this.categoryId,
      required this.categoryName,
      required this.frequency,
      required this.startDate,
      this.endDate,
      this.lastGenerated,
      required this.nextDueDate,
      this.note,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt});

  factory _$RecurringTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecurringTransactionImplFromJson(json);

  @override
  final int id;
  @override
  final double amount;
  @override
  final String type;
// 'income' or 'expense'
  @override
  final int categoryId;
  @override
  final String categoryName;
  @override
  final RecurrenceFrequency frequency;
  @override
  final DateTime startDate;
  @override
  final DateTime? endDate;
  @override
  final DateTime? lastGenerated;
  @override
  final DateTime nextDueDate;
  @override
  final String? note;
  @override
  final bool isActive;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'RecurringTransaction(id: $id, amount: $amount, type: $type, categoryId: $categoryId, categoryName: $categoryName, frequency: $frequency, startDate: $startDate, endDate: $endDate, lastGenerated: $lastGenerated, nextDueDate: $nextDueDate, note: $note, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecurringTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.lastGenerated, lastGenerated) ||
                other.lastGenerated == lastGenerated) &&
            (identical(other.nextDueDate, nextDueDate) ||
                other.nextDueDate == nextDueDate) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      amount,
      type,
      categoryId,
      categoryName,
      frequency,
      startDate,
      endDate,
      lastGenerated,
      nextDueDate,
      note,
      isActive,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecurringTransactionImplCopyWith<_$RecurringTransactionImpl>
      get copyWith =>
          __$$RecurringTransactionImplCopyWithImpl<_$RecurringTransactionImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecurringTransactionImplToJson(
      this,
    );
  }
}

abstract class _RecurringTransaction implements RecurringTransaction {
  const factory _RecurringTransaction(
      {required final int id,
      required final double amount,
      required final String type,
      required final int categoryId,
      required final String categoryName,
      required final RecurrenceFrequency frequency,
      required final DateTime startDate,
      final DateTime? endDate,
      final DateTime? lastGenerated,
      required final DateTime nextDueDate,
      final String? note,
      required final bool isActive,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$RecurringTransactionImpl;

  factory _RecurringTransaction.fromJson(Map<String, dynamic> json) =
      _$RecurringTransactionImpl.fromJson;

  @override
  int get id;
  @override
  double get amount;
  @override
  String get type;
  @override // 'income' or 'expense'
  int get categoryId;
  @override
  String get categoryName;
  @override
  RecurrenceFrequency get frequency;
  @override
  DateTime get startDate;
  @override
  DateTime? get endDate;
  @override
  DateTime? get lastGenerated;
  @override
  DateTime get nextDueDate;
  @override
  String? get note;
  @override
  bool get isActive;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$RecurringTransactionImplCopyWith<_$RecurringTransactionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
