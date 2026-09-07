// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Budget _$BudgetFromJson(Map<String, dynamic> json) {
  return _Budget.fromJson(json);
}

/// @nodoc
mixin _$Budget {
  int get id => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BudgetCopyWith<Budget> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetCopyWith<$Res> {
  factory $BudgetCopyWith(Budget value, $Res Function(Budget) then) =
      _$BudgetCopyWithImpl<$Res, Budget>;
  @useResult
  $Res call(
      {int id,
      int categoryId,
      String categoryName,
      double amount,
      int month,
      int year,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$BudgetCopyWithImpl<$Res, $Val extends Budget>
    implements $BudgetCopyWith<$Res> {
  _$BudgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? amount = null,
    Object? month = null,
    Object? year = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$BudgetImplCopyWith<$Res> implements $BudgetCopyWith<$Res> {
  factory _$$BudgetImplCopyWith(
          _$BudgetImpl value, $Res Function(_$BudgetImpl) then) =
      __$$BudgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int categoryId,
      String categoryName,
      double amount,
      int month,
      int year,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$BudgetImplCopyWithImpl<$Res>
    extends _$BudgetCopyWithImpl<$Res, _$BudgetImpl>
    implements _$$BudgetImplCopyWith<$Res> {
  __$$BudgetImplCopyWithImpl(
      _$BudgetImpl _value, $Res Function(_$BudgetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? amount = null,
    Object? month = null,
    Object? year = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$BudgetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$BudgetImpl implements _Budget {
  const _$BudgetImpl(
      {required this.id,
      required this.categoryId,
      required this.categoryName,
      required this.amount,
      required this.month,
      required this.year,
      required this.createdAt,
      required this.updatedAt});

  factory _$BudgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetImplFromJson(json);

  @override
  final int id;
  @override
  final int categoryId;
  @override
  final String categoryName;
  @override
  final double amount;
  @override
  final int month;
  @override
  final int year;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Budget(id: $id, categoryId: $categoryId, categoryName: $categoryName, amount: $amount, month: $month, year: $year, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, categoryId, categoryName,
      amount, month, year, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetImplCopyWith<_$BudgetImpl> get copyWith =>
      __$$BudgetImplCopyWithImpl<_$BudgetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetImplToJson(
      this,
    );
  }
}

abstract class _Budget implements Budget {
  const factory _Budget(
      {required final int id,
      required final int categoryId,
      required final String categoryName,
      required final double amount,
      required final int month,
      required final int year,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$BudgetImpl;

  factory _Budget.fromJson(Map<String, dynamic> json) = _$BudgetImpl.fromJson;

  @override
  int get id;
  @override
  int get categoryId;
  @override
  String get categoryName;
  @override
  double get amount;
  @override
  int get month;
  @override
  int get year;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$BudgetImplCopyWith<_$BudgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BudgetWithSpending {
  Budget get budget => throw _privateConstructorUsedError;
  double get spent => throw _privateConstructorUsedError;
  double get remaining => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;
  BudgetStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BudgetWithSpendingCopyWith<BudgetWithSpending> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetWithSpendingCopyWith<$Res> {
  factory $BudgetWithSpendingCopyWith(
          BudgetWithSpending value, $Res Function(BudgetWithSpending) then) =
      _$BudgetWithSpendingCopyWithImpl<$Res, BudgetWithSpending>;
  @useResult
  $Res call(
      {Budget budget,
      double spent,
      double remaining,
      double percentage,
      BudgetStatus status});

  $BudgetCopyWith<$Res> get budget;
}

/// @nodoc
class _$BudgetWithSpendingCopyWithImpl<$Res, $Val extends BudgetWithSpending>
    implements $BudgetWithSpendingCopyWith<$Res> {
  _$BudgetWithSpendingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budget = null,
    Object? spent = null,
    Object? remaining = null,
    Object? percentage = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as Budget,
      spent: null == spent
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as double,
      remaining: null == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BudgetStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BudgetCopyWith<$Res> get budget {
    return $BudgetCopyWith<$Res>(_value.budget, (value) {
      return _then(_value.copyWith(budget: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BudgetWithSpendingImplCopyWith<$Res>
    implements $BudgetWithSpendingCopyWith<$Res> {
  factory _$$BudgetWithSpendingImplCopyWith(_$BudgetWithSpendingImpl value,
          $Res Function(_$BudgetWithSpendingImpl) then) =
      __$$BudgetWithSpendingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Budget budget,
      double spent,
      double remaining,
      double percentage,
      BudgetStatus status});

  @override
  $BudgetCopyWith<$Res> get budget;
}

/// @nodoc
class __$$BudgetWithSpendingImplCopyWithImpl<$Res>
    extends _$BudgetWithSpendingCopyWithImpl<$Res, _$BudgetWithSpendingImpl>
    implements _$$BudgetWithSpendingImplCopyWith<$Res> {
  __$$BudgetWithSpendingImplCopyWithImpl(_$BudgetWithSpendingImpl _value,
      $Res Function(_$BudgetWithSpendingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budget = null,
    Object? spent = null,
    Object? remaining = null,
    Object? percentage = null,
    Object? status = null,
  }) {
    return _then(_$BudgetWithSpendingImpl(
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as Budget,
      spent: null == spent
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as double,
      remaining: null == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BudgetStatus,
    ));
  }
}

/// @nodoc

class _$BudgetWithSpendingImpl implements _BudgetWithSpending {
  const _$BudgetWithSpendingImpl(
      {required this.budget,
      required this.spent,
      required this.remaining,
      required this.percentage,
      required this.status});

  @override
  final Budget budget;
  @override
  final double spent;
  @override
  final double remaining;
  @override
  final double percentage;
  @override
  final BudgetStatus status;

  @override
  String toString() {
    return 'BudgetWithSpending(budget: $budget, spent: $spent, remaining: $remaining, percentage: $percentage, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetWithSpendingImpl &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.spent, spent) || other.spent == spent) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, budget, spent, remaining, percentage, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetWithSpendingImplCopyWith<_$BudgetWithSpendingImpl> get copyWith =>
      __$$BudgetWithSpendingImplCopyWithImpl<_$BudgetWithSpendingImpl>(
          this, _$identity);
}

abstract class _BudgetWithSpending implements BudgetWithSpending {
  const factory _BudgetWithSpending(
      {required final Budget budget,
      required final double spent,
      required final double remaining,
      required final double percentage,
      required final BudgetStatus status}) = _$BudgetWithSpendingImpl;

  @override
  Budget get budget;
  @override
  double get spent;
  @override
  double get remaining;
  @override
  double get percentage;
  @override
  BudgetStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$BudgetWithSpendingImplCopyWith<_$BudgetWithSpendingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
