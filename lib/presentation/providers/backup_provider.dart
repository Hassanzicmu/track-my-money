import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';
import '../../services/backup_service.dart';
import 'database_provider.dart';

final backupServiceProvider = Provider<BackupService>((ref) {
  final transactionRepo = ref.watch(transactionRepositoryProvider);
  final categoryRepo = ref.watch(categoryRepositoryProvider);
  final budgetRepo = ref.watch(budgetRepositoryProvider);
  final recurringRepo = ref.watch(recurringTransactionRepositoryProvider);

  return BackupService(
    transactionRepo,
    categoryRepo,
    budgetRepo,
    recurringRepo,
  );
});

final backupActionsProvider = Provider<BackupActions>((ref) {
  final service = ref.watch(backupServiceProvider);
  return BackupActions(service);
});

class BackupActions {
  final BackupService _service;

  BackupActions(this._service);

  Future<File> createBackup() async {
    return await _service.createBackup();
  }

  Future<void> shareBackup(File file) async {
    await _service.shareBackup(file);
  }

  Future<String?> saveToDownloads(File file) async {
    final fileName = path.basename(file.path);
    final bytes = await file.readAsBytes();

    return await FilePicker.platform.saveFile(
      dialogTitle: 'Save Backup',
      fileName: fileName,
      bytes: bytes,
    );
  }

  Future<void> restoreBackup(File file) async {
    await _service.restoreBackup(file);
  }
}
