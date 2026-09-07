import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/category.dart';
import '../../domain/models/transaction.dart';
import '../../domain/repositories/category_repository.dart';
import 'database_provider.dart';

/// Provider that watches all categories
final categoriesProvider = StreamProvider<List<Category>>((ref) {
  final repository = ref.watch(categoryRepositoryProvider);
  return repository.watchAllCategories();
});

/// Provider that watches categories by type
final categoriesByTypeProvider =
StreamProvider.family<List<Category>, TransactionType>((ref, type) {
  final repository = ref.watch(categoryRepositoryProvider);
  return repository.watchCategoriesByType(type);
});

/// Provider for category actions
final categoryActionsProvider = Provider<CategoryActions>((ref) {
  final repository = ref.watch(categoryRepositoryProvider);
  return CategoryActions(repository);
});

/// Class containing all category actions
class CategoryActions {
  final CategoryRepository _repository;

  CategoryActions(this._repository);

  Future<void> addCategory({
    required String name,
    required TransactionType type,
    required int iconCodePoint,
    required int colorValue,
  }) async {
    await _repository.addCategory(
      name: name,
      type: type,
      iconCodePoint: iconCodePoint,
      colorValue: colorValue,
    );
  }

  Future<void> updateCategory(Category category) async {
    await _repository.updateCategory(category);
  }

  Future<void> deleteCategory(int id) async {
    await _repository.deleteCategory(id);
  }

  Future<bool> categoryNameExists(String name, TransactionType type) async {
    return await _repository.categoryNameExists(name, type);
  }

  Future<Category?> getCategoryById(int id) async {
    return await _repository.getCategoryById(id);
  }
}