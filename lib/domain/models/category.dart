import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/utils/json_converters.dart'; // Import the new converters
import 'transaction.dart';

part 'category.freezed.dart';
part 'category.g.dart'; // Ensure this line exists for JSON generation

/// Clean domain model for Category
@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    required String name,
    required TransactionType type,

    // Add converters here
    @IconDataConverter() required IconData icon,
    @ColorConverter() required Color color,

    required bool isDefault,
    required DateTime createdAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
