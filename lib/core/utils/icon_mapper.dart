import 'package:flutter/material.dart';

/// A utility class to map icon code points to constant IconData instances.
/// This is required for Flutter's icon tree shaking to work in release builds.
class IconMapper {
  /// Default icon to use when a code point is not found in the mapping.
  static const IconData defaultIcon = Icons.help_outline;

  /// Map of code points to constant IconData instances.
  /// All icons used in the app's categories must be registered here.
  static const Map<int, IconData> _iconMap = {
    0xe59c: Icons.shopping_bag,
    0xe52d: Icons.restaurant,
    0xe1b1: Icons.directions_car,
    0xe405: Icons.movie,
    0xe80c: Icons.school,
    0xe318: Icons.home,
    0xe195: Icons.flight,
    0xe52f: Icons.sports_soccer,
    0xe331: Icons.laptop,
    0xe44b: Icons.phone_android,
    0xe364: Icons.fitness_center,
    0xe91d: Icons.pets,
    0xe5d3: Icons.more_horiz,
  };

  /// Returns the constant [IconData] for the given [codePoint].
  /// Returns [defaultIcon] if the code point is not recognized.
  static IconData getIcon(int codePoint) {
    return _iconMap[codePoint] ?? defaultIcon;
  }

  /// List of all icons available for selection in the UI.
  static List<IconData> get allIcons => _iconMap.values.toList();
}
