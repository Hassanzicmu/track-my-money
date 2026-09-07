import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_strings.dart';
import '../../../domain/models/category.dart';
import '../../../domain/models/recurring_transaction.dart';
import '../../../domain/models/transaction.dart';
import '../../providers/category_provider.dart';
import '../../providers/recurring_transaction_provider.dart';

class AddRecurringDialog extends ConsumerStatefulWidget {
  final RecurringTransaction?
  recurring; // null = add, not null = edit

  const AddRecurringDialog({super.key, this.recurring});

  @override
  ConsumerState<AddRecurringDialog> createState() =>
      _AddRecurringDialogState();
}

class _AddRecurringDialogState
    extends ConsumerState<AddRecurringDialog> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

  TransactionType _selectedType = TransactionType.expense;
  Category? _selectedCategory;
  RecurrenceFrequency _selectedFrequency =
      RecurrenceFrequency.monthly;
  DateTime _startDate = DateTime.now();
  DateTime? _endDate;
  bool _hasEndDate = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.recurring != null) {
      final rec = widget.recurring!;
      _amountController.text = rec.amount.toStringAsFixed(2);
      _noteController.text = rec.note ?? '';
      _selectedType = rec.type == 'income'
          ? TransactionType.income
          : TransactionType.expense;
      _selectedFrequency = rec.frequency;
      _startDate = rec.startDate;
      _endDate = rec.endDate;
      _hasEndDate = rec.endDate != null;
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  bool get _isEditMode => widget.recurring != null;

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(
      categoriesByTypeProvider(_selectedType),
    );

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
                  _isEditMode ? 'Edit Recurring' : 'Add Recurring',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 24),

                // Type Selector
                SegmentedButton<TransactionType>(
                  segments: const [
                    ButtonSegment(
                      value: TransactionType.expense,
                      label: Text('Expense'),
                      icon: Icon(Icons.remove_circle_outline),
                    ),
                    ButtonSegment(
                      value: TransactionType.income,
                      label: Text('Income'),
                      icon: Icon(Icons.add_circle_outline),
                    ),
                  ],
                  selected: {_selectedType},
                  onSelectionChanged: (newSelection) {
                    setState(() {
                      _selectedType = newSelection.first;
                      _selectedCategory = null;
                    });
                  },
                ),
                const SizedBox(height: 16),

                // Amount Input
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    labelText: AppStrings.amount,
                    prefixIcon: Icon(Icons.attach_money),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^\d+\.?\d{0,2}'),
                    ),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.amountRequired;
                    }
                    final amount = double.tryParse(value);
                    if (amount == null || amount <= 0) {
                      return AppStrings.amountInvalid;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Category Selector
                categoriesAsync.when(
                  data: (categories) {
                    return DropdownButtonFormField<Category>(
                      value: _selectedCategory,
                      decoration: const InputDecoration(
                        labelText: AppStrings.category,
                        prefixIcon: Icon(Icons.category),
                      ),
                      items: categories.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Row(
                            children: [
                              Icon(
                                category.icon,
                                color: category.color,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(category.name),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return AppStrings.categoryRequired;
                        }
                        return null;
                      },
                    );
                  },
                  loading: () => const LinearProgressIndicator(),
                  error: (_, __) =>
                      const Text('Error loading categories'),
                ),
                const SizedBox(height: 16),

                // Frequency Selector
                DropdownButtonFormField<RecurrenceFrequency>(
                  value: _selectedFrequency,
                  decoration: const InputDecoration(
                    labelText: 'Frequency',
                    prefixIcon: Icon(Icons.repeat),
                  ),
                  items: RecurrenceFrequency.values.map((frequency) {
                    return DropdownMenuItem(
                      value: frequency,
                      child: Text(frequency.displayName),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedFrequency = value;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),

                // Start Date
                InkWell(
                  onTap: _pickStartDate,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Start Date',
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    child: Text(
                      DateFormat('MMM dd, yyyy').format(_startDate),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // End Date Toggle
                CheckboxListTile(
                  title: const Text('Set End Date'),
                  value: _hasEndDate,
                  onChanged: (value) {
                    setState(() {
                      _hasEndDate = value ?? false;
                      if (!_hasEndDate) {
                        _endDate = null;
                      }
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                ),

                // End Date Picker (if enabled)
                if (_hasEndDate) ...[
                  InkWell(
                    onTap: _pickEndDate,
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'End Date',
                        prefixIcon: Icon(Icons.event),
                      ),
                      child: Text(
                        _endDate != null
                            ? DateFormat(
                                'MMM dd, yyyy',
                              ).format(_endDate!)
                            : 'Select date',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

                // Note Input
                TextFormField(
                  controller: _noteController,
                  decoration: const InputDecoration(
                    labelText:
                        '${AppStrings.note} (${AppStrings.optional})',
                    prefixIcon: Icon(Icons.note),
                  ),
                  maxLines: 2,
                  maxLength: 200,
                ),
                const SizedBox(height: 24),

                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: _isLoading
                          ? null
                          : () => Navigator.pop(context),
                      child: const Text(AppStrings.cancel),
                    ),
                    const SizedBox(width: 8),
                    FilledButton(
                      onPressed: _isLoading ? null : _saveRecurring,
                      child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(AppStrings.save),
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

  Future<void> _pickStartDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  Future<void> _pickEndDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate:
          _endDate ?? _startDate.add(const Duration(days: 365)),
      firstDate: _startDate,
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _endDate = picked;
      });
    }
  }

  Future<void> _saveRecurring() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedCategory == null) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final actions = ref.read(recurringTransactionActionsProvider);
      final amount = double.parse(_amountController.text);
      final note = _noteController.text.trim();

      // Validate
      final error = actions.validateRecurrence(
        amount: amount,
        startDate: _startDate,
        endDate: _endDate,
      );

      if (error != null) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(error)));
        }
        setState(() {
          _isLoading = false;
        });
        return;
      }

      if (_isEditMode) {
        // Update existing
        final updated = widget.recurring!.copyWith(
          amount: amount,
          type: _selectedType.name,
          categoryId: _selectedCategory!.id,
          categoryName: _selectedCategory!.name,
          frequency: _selectedFrequency,
          startDate: _startDate,
          endDate: _endDate,
          note: note.isEmpty ? null : note,
        );
        await actions.updateRecurringTransaction(updated);
      } else {
        // Create new
        await actions.createRecurringTransaction(
          amount: amount,
          type: _selectedType.name,
          categoryId: _selectedCategory!.id,
          frequency: _selectedFrequency,
          startDate: _startDate,
          endDate: _endDate,
          note: note.isEmpty ? null : note,
        );
      }

      if (mounted) {
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
