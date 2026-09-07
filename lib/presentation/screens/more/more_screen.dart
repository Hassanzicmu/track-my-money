import 'package:flutter/material.dart';
import '../settings/settings_screen.dart';
import '../backup/backup_screen.dart';
import '../investments/investments_screen.dart';
import '../goals/goals_screen.dart';



class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Grouping feature items into a list for cleaner management
    final List<Map<String, dynamic>> featureItems = [
      // Add the new "Investments" item here, for example at the top of the list.
      {
        'icon': Icons.trending_up_outlined,
        'title': 'Investments',
        'subtitle': 'Track your wealth portfolio',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InvestmentsScreen()),
          );
        },
      },
      {
        'icon': Icons.flag_outlined,
        'title': 'Financial Goals',
        'subtitle': 'Plan and track your savings goals',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GoalsScreen()),
          );
        },
      },
      {
        'icon': Icons.backup_outlined,
        'title': 'Backup & Restore',
        'subtitle': 'Export and import your data',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BackupScreen()),
          );
        },
      },
      {
        'icon': Icons.file_download_outlined,
        'title': 'Export Reports',
        'subtitle': 'Generate PDF and CSV reports',
        'onTap': () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Export Reports - Coming Soon')),
          );
        },
      },
      {
        'icon': Icons.settings_outlined,
        'title': 'Settings',
        'subtitle': 'App preferences and notifications',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingsScreen()),
          );
        },
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('More Features'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: TextButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('About - Coming Soon')),
                );
              },
              label: Text(
                'About',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onSurface,
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
              icon: Icon(
                Icons.info_outline,
                size: 24,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        itemCount: featureItems.length,
        // Using ListView.separated for cleaner spacing between items
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = featureItems[index];
          return _buildFeatureCard(
            context: context,
            icon: item['icon'],
            title: item['title'],
            subtitle: item['subtitle'],
            onTap: item['onTap'],
          );
        },

      ),
    );
  }

  /// A card that represents a feature in the app.
  Widget _buildFeatureCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 0, // Removing shadow for a flatter, more modern look
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).dividerColor, // Using divider color for a subtle border
        ),
        borderRadius: BorderRadius.circular(12), // Slightly larger radius
      ),
      clipBehavior: Clip.antiAlias, // Ensures the InkWell ripple respects the border radius
      margin: EdgeInsets.zero, // The ListView now handles the spacing
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Icon Container
              Container(
                padding: const EdgeInsets.all(12), // keep same padding
                decoration: BoxDecoration(
                  color: colorScheme.primary.withOpacity(0.12), // softer tint
                  borderRadius: BorderRadius.circular(16), // keep same radius
                ),
                child: Icon(
                  icon,
                  color: colorScheme.primary, // strong primary icon color
                  size: 28, // keep same size
                ),
              ),
              const SizedBox(width: 16),
              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: textTheme.bodyMedium?.copyWith(
                        color: textTheme.bodySmall?.color,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Forward Arrow Icon
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: textTheme.bodySmall?.color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
