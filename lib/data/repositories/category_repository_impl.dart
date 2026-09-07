import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import '../../domain/models/category.dart' as domain;
import '../../domain/models/transaction.dart';
import '../../domain/repositories/category_repository.dart';
import '../local/database/app_database.dart';
import '../../core/utils/icon_mapper.dart';

/// Implementation of CategoryRepository using Drift database
class CategoryRepositoryImpl implements CategoryRepository {
  final AppDatabase _database;

  CategoryRepositoryImpl(this._database);

  @override
  Stream<List<domain.Category>> watchAllCategories() {
    return _database.watchAllCategories().map(
          (entities) => entities.map(_entityToModel).toList(),
    );
  }

  @override
  Stream<List<domain.Category>> watchCategoriesByType(TransactionType type) {
    return _database.watchCategoriesByType(type.name).map(
          (entities) => entities.map(_entityToModel).toList(),
    );
  }

  @override
  Future<domain.Category?> getCategoryById(int id) async {
    final entity = await _database.getCategoryById(id);
    return entity != null ? _entityToModel(entity) : null;
  }

  @override
  Future<int> addCategory({
    required String name,
    required TransactionType type,
    required int iconCodePoint,
    required int colorValue,
  }) {
    final companion = CategoryEntitiesCompanion(
      name: drift.Value(name),
      type: drift.Value(type.name),
      iconCodePoint: drift.Value(iconCodePoint),
      colorValue: drift.Value(colorValue),
      isDefault: const drift.Value(false),
    );

    return _database.insertCategory(companion);
  }

  @override
  Future<bool> updateCategory(domain.Category category) {
    final entity = _modelToEntity(category);
    return _database.updateCategory(entity);
  }

  @override
  Future<void> deleteCategory(int id) async {
    final entity = await _database.getCategoryById(id);
    if (entity != null) {
      await _database.deleteCategory(entity);
    }
  }

  @override
  Future<bool> categoryNameExists(String name, TransactionType type) {
    return _database.categoryNameExists(name, type.name);
  }

  // --- ADD THIS IMPLEMENTATION ---


  @override
  Future<void> insertCategories(List<domain.Category> categories) async {final companions = categories.map((c) {
    // CORRECTED: Removed `createdAt` from the insert companion.
    return CategoryEntitiesCompanion.insert(
      name: c.name,
      type: c.type.name,
      iconCodePoint: c.icon.codePoint,
      colorValue: c.color.value,
      // CORRECTED: Wrapped the boolean value in drift.Value()
      isDefault: drift.Value(c.isDefault),
    );
  }).toList();

  await _database.batch((batch) {
    batch.insertAll(_database.categoryEntities, companions);
  });
  }

  @override
  Future<void> clearAllCategories() async {
    await _database.delete(_database.categoryEntities).go();
  }

  // ==========================================
  // HELPER METHODS
  // ==========================================

  /// Convert database entity to domain model
  domain.Category _entityToModel(CategoryEntity entity) {
    return domain.Category(
      id: entity.id,
      name: entity.name,
      type: TransactionType.values.firstWhere((e) => e.name == entity.type),
      icon: IconMapper.getIcon(entity.iconCodePoint),
      color: Color(entity.colorValue),
      isDefault: entity.isDefault,
      createdAt: entity.createdAt,
    );
  }

  /// Convert domain model to database entity
  CategoryEntity _modelToEntity(domain.Category model) {
    return CategoryEntity(
      id: model.id,
      name: model.name,
      type: model.type.name,
      iconCodePoint: model.icon.codePoint,
      colorValue: model.color.value,
      isDefault: model.isDefault,
      createdAt: model.createdAt,
    );
  }
}
