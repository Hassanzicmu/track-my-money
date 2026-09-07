// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvestmentImpl _$$InvestmentImplFromJson(Map<String, dynamic> json) =>
    _$InvestmentImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      assetType: $enumDecode(_$AssetTypeEnumMap, json['assetType']),
      investedAmount: (json['investedAmount'] as num).toDouble(),
      currentValue: (json['currentValue'] as num).toDouble(),
      investmentDate: DateTime.parse(json['investmentDate'] as String),
      maturityDate: json['maturityDate'] == null
          ? null
          : DateTime.parse(json['maturityDate'] as String),
      notes: json['notes'] as String?,
      isRecurring: json['isRecurring'] as bool,
      recurringAmount: (json['recurringAmount'] as num?)?.toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$InvestmentImplToJson(_$InvestmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'assetType': _$AssetTypeEnumMap[instance.assetType]!,
      'investedAmount': instance.investedAmount,
      'currentValue': instance.currentValue,
      'investmentDate': instance.investmentDate.toIso8601String(),
      'maturityDate': instance.maturityDate?.toIso8601String(),
      'notes': instance.notes,
      'isRecurring': instance.isRecurring,
      'recurringAmount': instance.recurringAmount,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$AssetTypeEnumMap = {
  AssetType.stocks: 'stocks',
  AssetType.mutualFunds: 'mutualFunds',
  AssetType.fixedDeposit: 'fixedDeposit',
  AssetType.gold: 'gold',
  AssetType.crypto: 'crypto',
  AssetType.ppf: 'ppf',
  AssetType.realEstate: 'realEstate',
};
