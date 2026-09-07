// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardStats {
  double get totalIncome => throw _privateConstructorUsedError;
  double get totalExpense => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  Map<String, double> get expenseByCategory =>
      throw _privateConstructorUsedError;
  Map<String, double> get incomeByCategory =>
      throw _privateConstructorUsedError;
  int get transactionCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardStatsCopyWith<DashboardStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStatsCopyWith<$Res> {
  factory $DashboardStatsCopyWith(
          DashboardStats value, $Res Function(DashboardStats) then) =
      _$DashboardStatsCopyWithImpl<$Res, DashboardStats>;
  @useResult
  $Res call(
      {double totalIncome,
      double totalExpense,
      double balance,
      Map<String, double> expenseByCategory,
      Map<String, double> incomeByCategory,
      int transactionCount});
}

/// @nodoc
class _$DashboardStatsCopyWithImpl<$Res, $Val extends DashboardStats>
    implements $DashboardStatsCopyWith<$Res> {
  _$DashboardStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalIncome = null,
    Object? totalExpense = null,
    Object? balance = null,
    Object? expenseByCategory = null,
    Object? incomeByCategory = null,
    Object? transactionCount = null,
  }) {
    return _then(_value.copyWith(
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      expenseByCategory: null == expenseByCategory
          ? _value.expenseByCategory
          : expenseByCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      incomeByCategory: null == incomeByCategory
          ? _value.incomeByCategory
          : incomeByCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardStatsImplCopyWith<$Res>
    implements $DashboardStatsCopyWith<$Res> {
  factory _$$DashboardStatsImplCopyWith(_$DashboardStatsImpl value,
          $Res Function(_$DashboardStatsImpl) then) =
      __$$DashboardStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalIncome,
      double totalExpense,
      double balance,
      Map<String, double> expenseByCategory,
      Map<String, double> incomeByCategory,
      int transactionCount});
}

/// @nodoc
class __$$DashboardStatsImplCopyWithImpl<$Res>
    extends _$DashboardStatsCopyWithImpl<$Res, _$DashboardStatsImpl>
    implements _$$DashboardStatsImplCopyWith<$Res> {
  __$$DashboardStatsImplCopyWithImpl(
      _$DashboardStatsImpl _value, $Res Function(_$DashboardStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalIncome = null,
    Object? totalExpense = null,
    Object? balance = null,
    Object? expenseByCategory = null,
    Object? incomeByCategory = null,
    Object? transactionCount = null,
  }) {
    return _then(_$DashboardStatsImpl(
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      expenseByCategory: null == expenseByCategory
          ? _value._expenseByCategory
          : expenseByCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      incomeByCategory: null == incomeByCategory
          ? _value._incomeByCategory
          : incomeByCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DashboardStatsImpl implements _DashboardStats {
  const _$DashboardStatsImpl(
      {required this.totalIncome,
      required this.totalExpense,
      required this.balance,
      required final Map<String, double> expenseByCategory,
      required final Map<String, double> incomeByCategory,
      required this.transactionCount})
      : _expenseByCategory = expenseByCategory,
        _incomeByCategory = incomeByCategory;

  @override
  final double totalIncome;
  @override
  final double totalExpense;
  @override
  final double balance;
  final Map<String, double> _expenseByCategory;
  @override
  Map<String, double> get expenseByCategory {
    if (_expenseByCategory is EqualUnmodifiableMapView)
      return _expenseByCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_expenseByCategory);
  }

  final Map<String, double> _incomeByCategory;
  @override
  Map<String, double> get incomeByCategory {
    if (_incomeByCategory is EqualUnmodifiableMapView) return _incomeByCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_incomeByCategory);
  }

  @override
  final int transactionCount;

  @override
  String toString() {
    return 'DashboardStats(totalIncome: $totalIncome, totalExpense: $totalExpense, balance: $balance, expenseByCategory: $expenseByCategory, incomeByCategory: $incomeByCategory, transactionCount: $transactionCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStatsImpl &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            const DeepCollectionEquality()
                .equals(other._expenseByCategory, _expenseByCategory) &&
            const DeepCollectionEquality()
                .equals(other._incomeByCategory, _incomeByCategory) &&
            (identical(other.transactionCount, transactionCount) ||
                other.transactionCount == transactionCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalIncome,
      totalExpense,
      balance,
      const DeepCollectionEquality().hash(_expenseByCategory),
      const DeepCollectionEquality().hash(_incomeByCategory),
      transactionCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStatsImplCopyWith<_$DashboardStatsImpl> get copyWith =>
      __$$DashboardStatsImplCopyWithImpl<_$DashboardStatsImpl>(
          this, _$identity);
}

abstract class _DashboardStats implements DashboardStats {
  const factory _DashboardStats(
      {required final double totalIncome,
      required final double totalExpense,
      required final double balance,
      required final Map<String, double> expenseByCategory,
      required final Map<String, double> incomeByCategory,
      required final int transactionCount}) = _$DashboardStatsImpl;

  @override
  double get totalIncome;
  @override
  double get totalExpense;
  @override
  double get balance;
  @override
  Map<String, double> get expenseByCategory;
  @override
  Map<String, double> get incomeByCategory;
  @override
  int get transactionCount;
  @override
  @JsonKey(ignore: true)
  _$$DashboardStatsImplCopyWith<_$DashboardStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategorySpending {
  String get categoryName => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;
  int get iconCodePoint => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategorySpendingCopyWith<CategorySpending> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorySpendingCopyWith<$Res> {
  factory $CategorySpendingCopyWith(
          CategorySpending value, $Res Function(CategorySpending) then) =
      _$CategorySpendingCopyWithImpl<$Res, CategorySpending>;
  @useResult
  $Res call(
      {String categoryName,
      double amount,
      double percentage,
      int color,
      int iconCodePoint});
}

/// @nodoc
class _$CategorySpendingCopyWithImpl<$Res, $Val extends CategorySpending>
    implements $CategorySpendingCopyWith<$Res> {
  _$CategorySpendingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? amount = null,
    Object? percentage = null,
    Object? color = null,
    Object? iconCodePoint = null,
  }) {
    return _then(_value.copyWith(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      iconCodePoint: null == iconCodePoint
          ? _value.iconCodePoint
          : iconCodePoint // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategorySpendingImplCopyWith<$Res>
    implements $CategorySpendingCopyWith<$Res> {
  factory _$$CategorySpendingImplCopyWith(_$CategorySpendingImpl value,
          $Res Function(_$CategorySpendingImpl) then) =
      __$$CategorySpendingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String categoryName,
      double amount,
      double percentage,
      int color,
      int iconCodePoint});
}

/// @nodoc
class __$$CategorySpendingImplCopyWithImpl<$Res>
    extends _$CategorySpendingCopyWithImpl<$Res, _$CategorySpendingImpl>
    implements _$$CategorySpendingImplCopyWith<$Res> {
  __$$CategorySpendingImplCopyWithImpl(_$CategorySpendingImpl _value,
      $Res Function(_$CategorySpendingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? amount = null,
    Object? percentage = null,
    Object? color = null,
    Object? iconCodePoint = null,
  }) {
    return _then(_$CategorySpendingImpl(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      iconCodePoint: null == iconCodePoint
          ? _value.iconCodePoint
          : iconCodePoint // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CategorySpendingImpl implements _CategorySpending {
  const _$CategorySpendingImpl(
      {required this.categoryName,
      required this.amount,
      required this.percentage,
      required this.color,
      required this.iconCodePoint});

  @override
  final String categoryName;
  @override
  final double amount;
  @override
  final double percentage;
  @override
  final int color;
  @override
  final int iconCodePoint;

  @override
  String toString() {
    return 'CategorySpending(categoryName: $categoryName, amount: $amount, percentage: $percentage, color: $color, iconCodePoint: $iconCodePoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorySpendingImpl &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.iconCodePoint, iconCodePoint) ||
                other.iconCodePoint == iconCodePoint));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, categoryName, amount, percentage, color, iconCodePoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorySpendingImplCopyWith<_$CategorySpendingImpl> get copyWith =>
      __$$CategorySpendingImplCopyWithImpl<_$CategorySpendingImpl>(
          this, _$identity);
}

abstract class _CategorySpending implements CategorySpending {
  const factory _CategorySpending(
      {required final String categoryName,
      required final double amount,
      required final double percentage,
      required final int color,
      required final int iconCodePoint}) = _$CategorySpendingImpl;

  @override
  String get categoryName;
  @override
  double get amount;
  @override
  double get percentage;
  @override
  int get color;
  @override
  int get iconCodePoint;
  @override
  @JsonKey(ignore: true)
  _$$CategorySpendingImplCopyWith<_$CategorySpendingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
