import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_strings.dart';
import '../../../domain/models/transaction.dart';
import '../../providers/category_provider.dart';
import '../../providers/transaction_provider.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {
  final Transaction?
  transaction; // null = add mode, not null = edit mode

  const AddTransactionScreen({super.key, this.transaction});

  @override
  ConsumerState<AddTransactionScreen> createState() =>
      _AddTransactionScreenState();
}

class _AddTransactionScreenState
    extends ConsumerState<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

  TransactionType _selectedType = TransactionType.expense;
  String? _selectedCategory;
  DateTime _selectedDate = DateTime.now();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // If editing, populate fields
    if (widget.transaction != null) {
      final txn = widget.transaction!;
      _amountController.text = txn.amount.toStringAsFixed(2);
      _noteController.text = txn.note ?? '';
      _selectedType = txn.type;
      _selectedCategory = txn.category;
      _selectedDate = txn.date;
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  bool get _isEditMode => widget.transaction != null;

  List<String> get _availableCategories {
    return _selectedType == TransactionType.income
        ? AppStrings.incomeCategories
        : AppStrings.expenseCategories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEditMode
              ? AppStrings.editTransaction
              : AppStrings.addTransaction,
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Transaction Type Selector
            _buildTypeSelector(),
            const SizedBox(height: 24),

            // Amount Input
            _buildAmountField(),
            const SizedBox(height: 16),

            // Category Selector
            _buildCategoryField(),
            const SizedBox(height: 16),

            // Date Picker
            _buildDateField(),
            const SizedBox(height: 16),

            // Note Input
            _buildNoteField(),
            const SizedBox(height: 32),

            // Save Button
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  /// Transaction Type Selector (Income/Expense)
  Widget _buildTypeSelector() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final incomeColor = isDark ? AppColors.darkIncome : AppColors.lightIncome;
    final expenseColor = isDark ? AppColors.darkExpense : AppColors.lightExpense;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.selectType,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        SegmentedButton<TransactionType>(
          segments: [
            ButtonSegment(
              value: TransactionType.expense,
              label: Text(AppStrings.expense),
              icon: const Icon(Icons.remove_circle_outline),
            ),
            ButtonSegment(
              value: TransactionType.income,
              label: Text(AppStrings.income),
              icon: const Icon(Icons.add_circle_outline),
            ),
          ],
          selected: {_selectedType},
          onSelectionChanged: (Set<TransactionType> newSelection) {
            setState(() {
              _selectedType = newSelection.first;
              // Reset category when type changes
              _selectedCategory = null;
            });
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith((
                states,
                ) {
              if (states.contains(WidgetState.selected)) {
                return _selectedType == TransactionType.income
                    ? incomeColor.withOpacity(0.2)
                    : expenseColor.withOpacity(0.2);
              }
              return null;
            }),
          ),
        ),
      ],
    );
  }

  /// Amount Input Field
  Widget _buildAmountField() {
    return TextFormField(
      controller: _amountController,
      decoration: InputDecoration(
        labelText: AppStrings.amount,
        prefixIcon: const Icon(Icons.attach_money),
        hintText: '0.00',
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
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
      autofocus: !_isEditMode, // Auto-focus when adding new
    );
  }

  /// Category Dropdown Field
  Widget _buildCategoryField() {
    // Watch categories based on selected type
    final categoriesAsync = ref.watch(
      categoriesByTypeProvider(_selectedType),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.category,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        categoriesAsync.when(
          data: (categories) {
            return Wrap(
              spacing: 12,
              runSpacing: 12,
              children: categories.map((category) {
                final isSelected = _selectedCategory == category.name;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = category.name;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? category.color.withOpacity(0.15)
                          : Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected
                            ? category.color
                            : Theme.of(context).colorScheme.outline.withOpacity(0.2),
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(category.icon, color: category.color, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          category.name,
                          style: TextStyle(
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            color: isSelected
                                ? category.color
                                : Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
          loading: () => const LinearProgressIndicator(),
          error: (_, __) => const Text('Error loading categories'),
        ),
        if (_selectedCategory == null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 4.0),
            child: Text(
              'Please select a category',
              style: TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 12),
            ),
          ),
      ],
    );
  }

  /// Date Picker Field
  Widget _buildDateField() {
    final formatter = DateFormat('MMM dd, yyyy');

    return InkWell(
      onTap: _pickDate,
      child: InputDecorator(
        decoration: const InputDecoration(
          labelText: AppStrings.date,
          prefixIcon: Icon(Icons.calendar_today),
        ),
        child: Text(
          formatter.format(_selectedDate),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }

  /// Note Input Field
  Widget _buildNoteField() {
    return TextFormField(
      controller: _noteController,
      decoration: const InputDecoration(
        labelText: '${AppStrings.note} (${AppStrings.optional})',
        prefixIcon: Icon(Icons.note),
        hintText: 'Add a note...',
      ),
      maxLines: 3,
      maxLength: 200,
    );
  }

  /// Save Button
  Widget _buildSaveButton() {
    return SizedBox(
      height: 56,
      child: FilledButton(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: _isLoading ? null : _saveTransaction,
        child: _isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
              )
            : const Text(AppStrings.save, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }

  /// Date Picker
  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  /// Save Transaction
  Future<void> _saveTransaction() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final actions = ref.read(transactionActionsProvider);
      final amount = double.parse(_amountController.text);
      final note = _noteController.text.trim();

      if (_isEditMode) {
        // Update existing transaction
        final updatedTransaction = widget.transaction!.copyWith(
          amount: amount,
          type: _selectedType,
          category: _selectedCategory!,
          date: _selectedDate,
          note: note.isEmpty ? null : note,
        );
        await actions.updateTransaction(updatedTransaction);
      } else {
        // Add new transaction
        await actions.addTransaction(
          amount: amount,
          type: _selectedType,
          category: _selectedCategory!,
          date: _selectedDate,
          note: note.isEmpty ? null : note,
        );
      }

      if (mounted) {
        Navigator.pop(context);
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
