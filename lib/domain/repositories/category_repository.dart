import '../models/category.dart';
import '../models/transaction.dart';

/// Repository interface for category operations
abstract class CategoryRepository {
  /// Watch all categories
  Stream<List<Category>> watchAllCategories();

  /// Watch categories by type (income/expense)
  Stream<List<Category>> watchCategoriesByType(TransactionType type);

  /// Get a single category
  Future<Category?> getCategoryById(int id);

  /// Add a new category
  Future<int> addCategory({
    required String name,
    required TransactionType type,
    required int iconCodePoint,
    required int colorValue,
  });

  /// Update a category
  Future<bool> updateCategory(Category category);

  /// Delete a category
  Future<void> deleteCategory(int id);

  /// Check if category name exists
  Future<bool> categoryNameExists(String name, TransactionType type);

  // --- ADD THESE METHODS ---/// Insert a list of categories (for backup restore)
  Future<void> insertCategories(List<Category> categories);

  /// Clear all categories (for backup restore)
  Future<void> clearAllCategories();

}