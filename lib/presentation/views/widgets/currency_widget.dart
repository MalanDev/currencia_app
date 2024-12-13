import 'package:currencia_app/domain/model/currency_model.dart';
import 'package:currencia_app/presentation/providers/currency_provider.dart';
import 'package:currencia_app/presentation/views/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrencyConverterWidget extends ConsumerStatefulWidget {
  const CurrencyConverterWidget({
    super.key,
    this.amount = 100.00,
    this.isEnable = true,
    required this.selectedCurrency,
    required this.onSelectedCurrency,
    required this.onRemove,
  });

  final double amount;
  final Currency selectedCurrency;
  final bool isEnable;
  final Function(String) onSelectedCurrency;
  final Function() onRemove;

  @override
  ConsumerState<CurrencyConverterWidget> createState() =>
      _CurrencyConverterWidgetState();
}

class _CurrencyConverterWidgetState
    extends ConsumerState<CurrencyConverterWidget> {
  final TextEditingController _controller = TextEditingController();

  final ValueNotifier<Currency?> _selectedCurrency = ValueNotifier(null);

  @override
  void initState() {
    _controller.text = widget.amount.toString();
    _selectedCurrency.value = widget.selectedCurrency;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  changeCurrency(Currency currency) {
    _selectedCurrency.value = currency;
    widget.onSelectedCurrency(currency.code);
    _controller.text = (currency.value * widget.amount.toDouble()).toString();
  }

  @override
  Widget build(BuildContext context) {
    final currencyState = ref.watch(currencyViewModelProvider);
    return Card(
      elevation: 0.2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              height: 50,
              child: AppTextField(
                controller: _controller,
                enabled: widget.isEnable,
                inputFormatters: [
                  TextInputFormatter.withFunction((oldValue, newValue) =>
                      newValue.text.isEmpty ||
                              (newValue.text.startsWith('.') &&
                                  newValue.text.length > 1)
                          ? newValue
                          : double.tryParse(newValue.text) != null
                              ? newValue
                              : oldValue)
                ],
              ),
            ),
            Row(
              children: [
                currencyState.when(
                  data: (currency) => ValueListenableBuilder(
                      valueListenable: _selectedCurrency,
                      builder: (context, selectedCurrencyValue, child) {
                        var selectedCurCode = selectedCurrencyValue != null
                            ? selectedCurrencyValue.code
                            : widget.selectedCurrency.code;
                        return DropdownButton(
                          value: selectedCurrencyValue != null
                              ? selectedCurrencyValue.code
                              : widget.selectedCurrency.code,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: currency.data.keys.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              enabled: selectedCurCode == items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            changeCurrency(currency.data[newValue]!);
                          },
                        );
                      }),
                  loading: () => const Center(
                      child: SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator())),
                  error: (error, stack) => Center(child: Text('Error: $error')),
                ),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                    onTap: () {
                      widget.onRemove();
                    },
                    child: const Icon(Icons.remove_circle))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
