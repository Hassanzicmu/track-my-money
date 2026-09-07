import 'package:flutter/material.dart';

/// App-wide color palette
/// Modern, vibrant theme using Indigo, Emerald, and Slate
class AppColors {
  AppColors._();

  // ==========================================
  // BRAND COLORS
  // ==========================================
  static const Color primary = Color(0xFF6366F1); // Modern Indigo
  static const Color primaryLight = Color(0xFF818CF8);
  static const Color primaryDark = Color(0xFF4338CA);
  
  static const Color secondary = Color(0xFF10B981); // Emerald Green
  
  static const Color income = Color(0xFF10B981); // Emerald
  static const Color expense = Color(0xFFEF4444); // Red
  static const Color warning = Color(0xFFF59E0B); // Amber
  static const Color info = Color(0xFF3B82F6); // Blue

  // ==========================================
  // LIGHT THEME COLORS
  // ==========================================
  static const Color lightPrimary = primary;
  static const Color lightOnPrimary = Colors.white;
  static const Color lightSecondary = secondary;
  static const Color lightOnSecondary = Colors.white;

  static const Color lightBackground = Color(0xFFF8FAFC); // Slate 50
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFF1F5F9); // Slate 100

  static const Color lightTextPrimary = Color(0xFF0F172A); // Slate 900
  static const Color lightTextSecondary = Color(0xFF64748B); // Slate 500
  static const Color lightTextTertiary = Color(0xFF94A3B8); // Slate 400

  static const Color lightBorder = Color(0xFFE2E8F0); // Slate 200
  static const Color lightDivider = Color(0xFFF1F5F9);

  static const Color lightIncome = income;
  static const Color lightExpense = expense;
  static const Color lightSuccess = income;
  static const Color lightWarning = warning;
  static const Color lightError = expense;
  static const Color lightInfo = info;

  // ==========================================
  // DARK THEME COLORS
  // ==========================================
  static const Color darkPrimary = primaryLight; 
  static const Color darkOnPrimary = Colors.white;
  static const Color darkSecondary = secondary;
  static const Color darkOnSecondary = Colors.white;

  static const Color darkBackground = Color(0xFF0F172A); // Slate 900
  static const Color darkSurface = Color(0xFF1E293B); // Slate 800
  static const Color darkSurfaceVariant = Color(0xFF334155); // Slate 700

  static const Color darkTextPrimary = Color(0xFFF8FAFC); // Slate 50
  static const Color darkTextSecondary = Color(0xFF94A3B8); // Slate 400
  static const Color darkTextTertiary = Color(0xFF64748B); // Slate 500

  static const Color darkBorder = Color(0xFF334155); // Slate 700
  static const Color darkDivider = Color(0xFF1E293B);

  static const Color darkIncome = income;
  static const Color darkExpense = expense;
  static const Color darkSuccess = income;
  static const Color darkWarning = warning;
  static const Color darkError = expense;
  static const Color darkInfo = info;

  // ==========================================
  // CATEGORY COLORS (Vibrant palette)
  // ==========================================
  static const List<Color> categoryColors = [
    Color(0xFF6366F1), // Indigo
    Color(0xFF10B981), // Emerald
    Color(0xFFF59E0B), // Amber
    Color(0xFFEF4444), // Red
    Color(0xFF3B82F6), // Blue
    Color(0xFF8B5CF6), // Purple
    Color(0xFFEC4899), // Pink
    Color(0xFF14B8A6), // Teal
    Color(0xFFF97316), // Orange
  ];

  // ==========================================
  // CHART COLORS
  // ==========================================
  static const List<Color> chartColors = [
    Color(0xFF6366F1), // Indigo
    Color(0xFF3B82F6), // Blue
    Color(0xFF14B8A6), // Teal
    Color(0xFF10B981), // Emerald
    Color(0xFF8B5CF6), // Purple
    Color(0xFFEC4899), // Pink
    Color(0xFFF59E0B), // Amber
    Color(0xFFEF4444), // Red
  ];
}