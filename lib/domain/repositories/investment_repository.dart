import '../models/investment.dart';

abstract class InvestmentRepository {
  Stream<List<Investment>> watchAllInvestments();

  Stream<List<Investment>> watchInvestmentsByType(AssetType type);

  Future<Investment?> getInvestmentById(int id);

  Future<int> addInvestment({
    required String name,
    required AssetType assetType,
    required double investedAmount,
    required double currentValue,
    required DateTime investmentDate,
    DateTime? maturityDate,
    String? notes,
    bool isRecurring = false,
    double? recurringAmount,
  });

  Future<void> updateInvestment(Investment investment);

  Future<void> deleteInvestment(int id);

  Future<double> getTotalPortfolioValue();

  Future<double> getTotalInvestedAmount();
}