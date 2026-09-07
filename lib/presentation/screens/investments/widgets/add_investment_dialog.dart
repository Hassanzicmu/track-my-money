import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../domain/models/investment.dart';
import '../../../providers/investment_provider.dart';

class AddInvestmentDialog extends ConsumerStatefulWidget {
  final Investment? investment;

  const AddInvestmentDialog({super.key, this.investment});

  @override
  ConsumerState<AddInvestmentDialog> createState() => _AddInvestmentDialogState();
}

class _AddInvestmentDialogState extends ConsumerState<AddInvestmentDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _investedController = TextEditingController();
  final _currentController = TextEditingController();
  final _notesController = TextEditingController();
  final _sipController = TextEditingController();

  AssetType _selectedType = AssetType.stocks;
  DateTime _investmentDate = DateTime.now();
  DateTime? _maturityDate;
  bool _isRecurring = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.investment != null) {
      final inv = widget.investment!;
      _nameController.text = inv.name;
      _investedController.text = inv.investedAmount.toStringAsFixed(2);
      _currentController.text = inv.currentValue.toStringAsFixed(2);
      _notesController.text = inv.notes ?? '';
      _selectedType = inv.assetType;
      _investmentDate = inv.investmentDate;
      _maturityDate = inv.maturityDate;
      _isRecurring = inv.isRecurring;
      if (inv.recurringAmount != null) {
        _sipController.text = inv.recurringAmount!.toStringAsFixed(2);
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _investedController.dispose();
    _currentController.dispose();
    _notesController.dispose();
    _sipController.dispose();
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
                  widget.investment != null ? 'Edit Investment' : 'Add Investment',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 24),

                // Name
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Investment Name',
                    prefixIcon: Icon(Icons.label),
                  ),
                  validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
                ),
                const SizedBox(height: 16),

                // Asset Type
                DropdownButtonFormField<AssetType>(
                  value: _selectedType,
                  decoration: const InputDecoration(
                    labelText: 'Asset Type',
                    prefixIcon: Icon(Icons.category),
                  ),
                  items: AssetType.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text('${type.icon} ${type.displayName}'),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) setState(() => _selectedType = value);
                  },
                ),
                const SizedBox(height: 16),

                // Invested Amount
                TextFormField(
                  controller: _investedController,
                  decoration: const InputDecoration(
                    labelText: 'Invested Amount',
                    prefixIcon: Icon(Icons.currency_rupee),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                  ],
                  validator: (v) {
                    if (v?.isEmpty ?? true) return 'Required';
                    if (double.tryParse(v!) == null) return 'Invalid amount';
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Current Value
                TextFormField(
                  controller: _currentController,
                  decoration: const InputDecoration(
                    labelText: 'Current Value',
                    prefixIcon: Icon(Icons.trending_up),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                  ],
                  validator: (v) {
                    if (v?.isEmpty ?? true) return 'Required';
                    if (double.tryParse(v!) == null) return 'Invalid amount';
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Investment Date
                InkWell(
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _investmentDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      setState(() => _investmentDate = picked);
                    }
                  },
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Investment Date',
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    child: Text(DateFormat('MMM dd, yyyy').format(_investmentDate)),
                  ),
                ),
                const SizedBox(height: 16),

                // SIP Toggle
                SwitchListTile(
                  value: _isRecurring,
                  onChanged: (v) => setState(() => _isRecurring = v),
                  title: const Text('Is this a SIP?'),
                  contentPadding: EdgeInsets.zero,
                ),

                if (_isRecurring) ...[
                  TextFormField(
                    controller: _sipController,
                    decoration: const InputDecoration(
                      labelText: 'Monthly SIP Amount',
                      prefixIcon: Icon(Icons.repeat),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],

                // Notes
                TextFormField(
                  controller: _notesController,
                  decoration: const InputDecoration(
                    labelText: 'Notes (Optional)',
                    prefixIcon: Icon(Icons.note),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 24),

                // Buttons
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
      final actions = ref.read(investmentActionsProvider);

      if (widget.investment != null) {
        await actions.updateInvestment(
          widget.investment!.copyWith(
            name: _nameController.text.trim(),
            assetType: _selectedType,
            investedAmount: double.parse(_investedController.text),
            currentValue: double.parse(_currentController.text),
            investmentDate: _investmentDate,
            maturityDate: _maturityDate,
            notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
            isRecurring: _isRecurring,
            recurringAmount: _isRecurring && _sipController.text.isNotEmpty
                ? double.parse(_sipController.text)
                : null,
          ),
        );
      } else {
        await actions.addInvestment(
          name: _nameController.text.trim(),
          assetType: _selectedType,
          investedAmount: double.parse(_investedController.text),
          currentValue: double.parse(_currentController.text),
          investmentDate: _investmentDate,
          maturityDate: _maturityDate,
          notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
          isRecurring: _isRecurring,
          recurringAmount: _isRecurring && _sipController.text.isNotEmpty
              ? double.parse(_sipController.text)
              : null,
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