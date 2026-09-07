import 'package:freezed_annotation/freezed_annotation.dart';


part 'investment.freezed.dart';
part 'investment.g.dart';

@freezed
class Investment with _$Investment {
  const factory Investment({
    required int id,
    required String name,
    required AssetType assetType,
    required double investedAmount,
    required double currentValue,
    required DateTime investmentDate,
    DateTime? maturityDate,
    String? notes,
    required bool isRecurring,
    double? recurringAmount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Investment;

  factory Investment.fromJson(Map<String, dynamic> json) =>
      _$InvestmentFromJson(json);
}

extension InvestmentCalculations on Investment {
  double get profitLoss => currentValue - investedAmount;

  double get growthPercentage {
    if (investedAmount == 0) return 0;
    return ((currentValue - investedAmount) / investedAmount) * 100;
  }

  bool get isProfit => profitLoss >= 0;
}

enum AssetType {
  stocks,
  mutualFunds,
  fixedDeposit,
  gold,
  crypto,
  ppf,
  realEstate;

  String get displayName {
    switch (this) {
      case AssetType.stocks:
        return 'Stocks';
      case AssetType.mutualFunds:
        return 'Mutual Funds';
      case AssetType.fixedDeposit:
        return 'Fixed Deposit';
      case AssetType.gold:
        return 'Gold';
      case AssetType.crypto:
        return 'Crypto';
      case AssetType.ppf:
        return 'PPF/EPF';
      case AssetType.realEstate:
        return 'Real Estate';
    }
  }

  String get icon {
    switch (this) {
      case AssetType.stocks:
        return '📈';
      case AssetType.mutualFunds:
        return '📊';
      case AssetType.fixedDeposit:
        return '🏦';
      case AssetType.gold:
        return '🪙';
      case AssetType.crypto:
        return '₿';
      case AssetType.ppf:
        return '🛡️';
      case AssetType.realEstate:
        return '🏠';
    }
  }
}