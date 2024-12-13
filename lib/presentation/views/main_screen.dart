import 'package:currencia_app/core/constants/app_constants.dart';
import 'package:currencia_app/core/utils/app_colors.dart';
import 'package:currencia_app/domain/model/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:currencia_app/presentation/views/widgets/currency_widget.dart';
import '../providers/currency_provider.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  ValueNotifier<double> selectedAmount = ValueNotifier(100.00);

  var currencyConvertItems = [
    CurrencyConverterWidget(
      amount: 100,
      isEnable: false,
      selectedCurrency: Currency(code: "USD", value: 0.23),
      onSelectedCurrency: (currency) {},
      onRemove: () {},
    ),
  ];

  @override
  void initState() {
    super.initState();
    _fetchCurrencies();
  }

  Future<void> _fetchCurrencies() async {
    setState(() {});
  }

  @override
  void dispose() {
    selectedAmount.dispose();
    super.dispose();
  }

  addConverter() {
    setState(() {
      currencyConvertItems.add(
        CurrencyConverterWidget(
          amount: 100,
          isEnable: false,
          selectedCurrency: Currency(code: "USD", value: 0.23),
          onSelectedCurrency: (currency) {},
          onRemove: () {},
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        AppConstants.APP_NAME,
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            ListView(
              children: [
                const Text("Insert Amount"),
                CurrencyConverterWidget(
                  amount: selectedAmount.value,
                  selectedCurrency: Currency(code: "USD", value: 0.23),
                  onSelectedCurrency: (currency) {},
                  onRemove: () {},
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text("Convert To"),
                ...currencyConvertItems,
                InkWell(
                  onTap: () {
                    addConverter();
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.buttonPrimary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Add Converter",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Last Update:\n ${ref.watch(currencyViewModelProvider).value?.meta.lastUpdatedAt ?? ""}" ??
                    "",
                style: const TextStyle(color: AppColors.textSecondary),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(currencyViewModelProvider.notifier).refreshCurrency();
        },
        child: const Icon(
          Icons.refresh,
          color: AppColors.buttonPrimary,
        ),
      ),
    );
  }
}
