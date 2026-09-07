import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/investment.dart';
import '../../domain/repositories/investment_repository.dart';
import 'database_provider.dart';

final investmentsProvider = StreamProvider<List<Investment>>((ref) {
  final repository = ref.watch(investmentRepositoryProvider);
  return repository.watchAllInvestments();
});

final portfolioSummaryProvider = FutureProvider<PortfolioSummary>((ref) async {
  final repository = ref.watch(investmentRepositoryProvider);

  final totalValue = await repository.getTotalPortfolioValue();
  final totalInvested = await repository.getTotalInvestedAmount();  final profitLoss = totalValue - totalInvested;

  // The result of this calculation is a 'num', so we convert it to 'double'.
  final growthPercentage = (totalInvested > 0 ? ((profitLoss / totalInvested) * 100) : 0).toDouble();

  return PortfolioSummary(
    totalValue: totalValue,
    totalInvested: totalInvested,
    profitLoss: profitLoss,
    growthPercentage: growthPercentage,
  );
});


final investmentActionsProvider = Provider<InvestmentActions>((ref) {
  final repository = ref.watch(investmentRepositoryProvider);
  return InvestmentActions(repository);
});

class InvestmentActions {
  final InvestmentRepository _repository;

  InvestmentActions(this._repository);

  Future<void> addInvestment({
    required String name,
    required AssetType assetType,
    required double investedAmount,
    required double currentValue,
    required DateTime investmentDate,
    DateTime? maturityDate,
    String? notes,
    bool isRecurring = false,
    double? recurringAmount,
  }) async {
    await _repository.addInvestment(
      name: name,
      assetType: assetType,
      investedAmount: investedAmount,
      currentValue: currentValue,
      investmentDate: investmentDate,
      maturityDate: maturityDate,
      notes: notes,
      isRecurring: isRecurring,
      recurringAmount: recurringAmount,
    );
  }

  Future<void> updateInvestment(Investment investment) async {
    await _repository.updateInvestment(investment);
  }

  Future<void> deleteInvestment(int id) async {
    await _repository.deleteInvestment(id);
  }
}

class PortfolioSummary {
  final double totalValue;
  final double totalInvested;
  final double profitLoss;
  final double growthPercentage;

  PortfolioSummary({
    required this.totalValue,
    required this.totalInvested,
    required this.profitLoss,
    required this.growthPercentage,
  });

  bool get isProfit => profitLoss >= 0;
}