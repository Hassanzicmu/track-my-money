import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track_my_money/presentation/providers/notification_provider.dart';
import 'core/theme/app_strings.dart';
import 'core/theme/app_theme.dart';
import 'domain/services/notification_service.dart';
import 'presentation/providers/recurring_transaction_provider.dart';
import 'presentation/providers/theme_provider.dart';
import 'presentation/screens/main_screen.dart';

import 'services/background_service.dart';

void main() async {
  WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await NotificationService().initialize();
  
  await BackgroundService.initialize();
  // await BackgroundService.registerPeriodicTasks();

  runApp(const ProviderScope(child: TrackMyMoneyApp()));
}

class TrackMyMoneyApp extends ConsumerStatefulWidget {
  const TrackMyMoneyApp({super.key});

  @override
  ConsumerState<TrackMyMoneyApp> createState() => _TrackMyMoneyAppState();
}

class _TrackMyMoneyAppState extends ConsumerState<TrackMyMoneyApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    _generateDueTransactions();
    _requestNotificationPermissions();

    FlutterNativeSplash.remove();
  }

  Future<void> _generateDueTransactions() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        final actions = ref.read(recurringTransactionActionsProvider);
        final count = await actions.generateDueTransactions();

        if (count > 0) {
          debugPrint('Generated $count recurring transaction(s)');
        }
      } catch (e) {
        debugPrint('Error generating recurring transactions: $e');
      }
    });
  }

  Future<void> _requestNotificationPermissions() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final prefs = ref.read(notificationPreferencesProvider);

      if (!prefs.hasRequestedPermission) {
        await Future.delayed(const Duration(seconds: 2));

        if (mounted) {
          _showPermissionDialog();
        }
      }
    });
  }

  void _showPermissionDialog() {
    final navContext = _navigatorKey.currentContext;
    if (navContext == null) return;

    showDialog(
      context: navContext,
      builder: (context) => AlertDialog(
        title: const Text('Stay on Track 📲'),
        content: const Text(
          'Get helpful reminders to track expenses and manage your budget.\n\n'
          'We\'ll send you:\n'
          '• Morning motivation\n'
          '• Budget alerts\n'
          '• Daily summaries\n\n'
          'You can customize or disable them anytime.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref
                  .read(notificationPreferencesProvider.notifier)
                  .markPermissionRequested();
            },
            child: const Text('Not Now'),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.pop(context);
              await ref
                  .read(notificationPreferencesProvider.notifier)
                  .requestPermissions();
            },
            child: const Text('Enable'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: AppStrings.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode.themeMode,
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
