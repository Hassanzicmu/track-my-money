import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../domain/models/goal.dart';
import '../../providers/goal_provider.dart';

class AddGoalDialog extends ConsumerStatefulWidget {
  final Goal? goal;

  const AddGoalDialog({super.key, this.goal});

  @override
  ConsumerState<AddGoalDialog> createState() => _AddGoalDialogState();
}

class _AddGoalDialogState extends ConsumerState<AddGoalDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _targetController = TextEditingController();
  final _currentController = TextEditingController();
  final _notesController = TextEditingController();

  DateTime _targetDate = DateTime.now().add(const Duration(days: 180));
  bool _enableReminders = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.goal != null) {
      final goal = widget.goal!;
      _nameController.text = goal.name;
      _targetController.text = goal.targetAmount.toStringAsFixed(2);
      _currentController.text = goal.currentAmount.toStringAsFixed(2);
      _notesController.text = goal.notes ?? '';
      _targetDate = goal.targetDate;
      _enableReminders = goal.enableReminders;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _targetController.dispose();
    _currentController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.goal != null ? 'Edit Goal' : 'Create Goal',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 24),

                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Goal Name',
                    prefixIcon: Icon(Icons.flag),
                  ),
                  validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _targetController,
                  decoration: const InputDecoration(
                    labelText: 'Target Amount',
                    prefixIcon: Icon(Icons.currency_rupee),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                  ],
                  validator: (v) {
                    if (v?.isEmpty ?? true) return 'Required';
                    if (double.tryParse(v!) == null) return 'Invalid';
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _currentController,
                  decoration: const InputDecoration(
                    labelText: 'Current Savings',
                    prefixIcon: Icon(Icons.savings),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                  ],
                ),
                const SizedBox(height: 16),

                InkWell(
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _targetDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 3650)),
                    );
                    if (picked != null) setState(() => _targetDate = picked);
                  },
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Target Date',
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    child: Text(DateFormat('MMM dd, yyyy').format(_targetDate)),
                  ),
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _notesController,
                  decoration: const InputDecoration(
                    labelText: 'Notes (Optional)',
                    prefixIcon: Icon(Icons.note),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 16),

                SwitchListTile(
                  value: _enableReminders,
                  onChanged: (v) => setState(() => _enableReminders = v),
                  title: const Text('Enable Reminders'),
                  contentPadding: EdgeInsets.zero,
                ),
                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 8),
                    FilledButton(
                      onPressed: _isLoading ? null : _save,
                      child: _isLoading
                          ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                          : const Text('Save'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final actions = ref.read(goalActionsProvider);

      if (widget.goal != null) {
        await actions.updateGoal(
          widget.goal!.copyWith(
            name: _nameController.text.trim(),
            targetAmount: double.parse(_targetController.text),
            currentAmount: _currentController.text.isEmpty
                ? 0
                : double.parse(_currentController.text),
            targetDate: _targetDate,
            notes: _notesController.text.trim().isEmpty
                ? null
                : _notesController.text.trim(),
            enableReminders: _enableReminders,
          ),
        );
      } else {
        await actions.addGoal(
          name: _nameController.text.trim(),
          targetAmount: double.parse(_targetController.text),
          currentAmount: _currentController.text.isEmpty
              ? 0
              : double.parse(_currentController.text),
          targetDate: _targetDate,
          notes: _notesController.text.trim().isEmpty
              ? null
              : _notesController.text.trim(),
          enableReminders: _enableReminders,
        );
      }

      if (mounted) Navigator.pop(context, true);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}