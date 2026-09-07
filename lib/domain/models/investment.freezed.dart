// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'investment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Investment _$InvestmentFromJson(Map<String, dynamic> json) {
  return _Investment.fromJson(json);
}

/// @nodoc
mixin _$Investment {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  AssetType get assetType => throw _privateConstructorUsedError;
  double get investedAmount => throw _privateConstructorUsedError;
  double get currentValue => throw _privateConstructorUsedError;
  DateTime get investmentDate => throw _privateConstructorUsedError;
  DateTime? get maturityDate => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  bool get isRecurring => throw _privateConstructorUsedError;
  double? get recurringAmount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvestmentCopyWith<Investment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvestmentCopyWith<$Res> {
  factory $InvestmentCopyWith(
          Investment value, $Res Function(Investment) then) =
      _$InvestmentCopyWithImpl<$Res, Investment>;
  @useResult
  $Res call(
      {int id,
      String name,
      AssetType assetType,
      double investedAmount,
      double currentValue,
      DateTime investmentDate,
      DateTime? maturityDate,
      String? notes,
      bool isRecurring,
      double? recurringAmount,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$InvestmentCopyWithImpl<$Res, $Val extends Investment>
    implements $InvestmentCopyWith<$Res> {
  _$InvestmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? assetType = null,
    Object? investedAmount = null,
    Object? currentValue = null,
    Object? investmentDate = null,
    Object? maturityDate = freezed,
    Object? notes = freezed,
    Object? isRecurring = null,
    Object? recurringAmount = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      assetType: null == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as AssetType,
      investedAmount: null == investedAmount
          ? _value.investedAmount
          : investedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      investmentDate: null == investmentDate
          ? _value.investmentDate
          : investmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      maturityDate: freezed == maturityDate
          ? _value.maturityDate
          : maturityDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isRecurring: null == isRecurring
          ? _value.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      recurringAmount: freezed == recurringAmount
          ? _value.recurringAmount
          : recurringAmount // ignore: cast_nullable_to_non_nullable
              as double?,
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
abstract class _$$InvestmentImplCopyWith<$Res>
    implements $InvestmentCopyWith<$Res> {
  factory _$$InvestmentImplCopyWith(
          _$InvestmentImpl value, $Res Function(_$InvestmentImpl) then) =
      __$$InvestmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      AssetType assetType,
      double investedAmount,
      double currentValue,
      DateTime investmentDate,
      DateTime? maturityDate,
      String? notes,
      bool isRecurring,
      double? recurringAmount,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$InvestmentImplCopyWithImpl<$Res>
    extends _$InvestmentCopyWithImpl<$Res, _$InvestmentImpl>
    implements _$$InvestmentImplCopyWith<$Res> {
  __$$InvestmentImplCopyWithImpl(
      _$InvestmentImpl _value, $Res Function(_$InvestmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? assetType = null,
    Object? investedAmount = null,
    Object? currentValue = null,
    Object? investmentDate = null,
    Object? maturityDate = freezed,
    Object? notes = freezed,
    Object? isRecurring = null,
    Object? recurringAmount = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$InvestmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      assetType: null == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as AssetType,
      investedAmount: null == investedAmount
          ? _value.investedAmount
          : investedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      investmentDate: null == investmentDate
          ? _value.investmentDate
          : investmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      maturityDate: freezed == maturityDate
          ? _value.maturityDate
          : maturityDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isRecurring: null == isRecurring
          ? _value.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      recurringAmount: freezed == recurringAmount
          ? _value.recurringAmount
          : recurringAmount // ignore: cast_nullable_to_non_nullable
              as double?,
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
class _$InvestmentImpl implements _Investment {
  const _$InvestmentImpl(
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

  factory _$InvestmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvestmentImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final AssetType assetType;
  @override
  final double investedAmount;
  @override
  final double currentValue;
  @override
  final DateTime investmentDate;
  @override
  final DateTime? maturityDate;
  @override
  final String? notes;
  @override
  final bool isRecurring;
  @override
  final double? recurringAmount;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Investment(id: $id, name: $name, assetType: $assetType, investedAmount: $investedAmount, currentValue: $currentValue, investmentDate: $investmentDate, maturityDate: $maturityDate, notes: $notes, isRecurring: $isRecurring, recurringAmount: $recurringAmount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvestmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.assetType, assetType) ||
                other.assetType == assetType) &&
            (identical(other.investedAmount, investedAmount) ||
                other.investedAmount == investedAmount) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.investmentDate, investmentDate) ||
                other.investmentDate == investmentDate) &&
            (identical(other.maturityDate, maturityDate) ||
                other.maturityDate == maturityDate) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isRecurring, isRecurring) ||
                other.isRecurring == isRecurring) &&
            (identical(other.recurringAmount, recurringAmount) ||
                other.recurringAmount == recurringAmount) &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvestmentImplCopyWith<_$InvestmentImpl> get copyWith =>
      __$$InvestmentImplCopyWithImpl<_$InvestmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvestmentImplToJson(
      this,
    );
  }
}

abstract class _Investment implements Investment {
  const factory _Investment(
      {required final int id,
      required final String name,
      required final AssetType assetType,
      required final double investedAmount,
      required final double currentValue,
      required final DateTime investmentDate,
      final DateTime? maturityDate,
      final String? notes,
      required final bool isRecurring,
      final double? recurringAmount,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$InvestmentImpl;

  factory _Investment.fromJson(Map<String, dynamic> json) =
      _$InvestmentImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  AssetType get assetType;
  @override
  double get investedAmount;
  @override
  double get currentValue;
  @override
  DateTime get investmentDate;
  @override
  DateTime? get maturityDate;
  @override
  String? get notes;
  @override
  bool get isRecurring;
  @override
  double? get recurringAmount;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$InvestmentImplCopyWith<_$InvestmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
