import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/currency_provider.dart';

class CurrencyProfileScreen extends ConsumerStatefulWidget {
  const CurrencyProfileScreen({super.key});

  @override
  ConsumerState<CurrencyProfileScreen> createState() =>
      _CurrencyProfileScreenState();
}

class _CurrencyProfileScreenState extends ConsumerState<CurrencyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final currencyState = ref.watch(currencyViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Currency Profile')),
      body: currencyState.when(
        data: (currency) =>
            Center(child: Text('Hello, ${currency.data.toString()}!')),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(currencyViewModelProvider.notifier).refreshCurrency();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
