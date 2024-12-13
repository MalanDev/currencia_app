import 'package:currencia_app/domain/model/currency_model.dart';
import 'package:currencia_app/domain/usecases/get_currency_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrencyViewModel extends StateNotifier<AsyncValue<CurrencyModel>> {
  final GetCurrencyUseCase _getCurrencyUseCase;

  CurrencyViewModel(this._getCurrencyUseCase)
      : super(const AsyncValue.loading()) {
    _fetchCurrency();
  }

  Future<void> _fetchCurrency() async {
    try {
      final currency = await _getCurrencyUseCase();
      state = AsyncValue.data(currency);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> refreshCurrency() async {
    state = const AsyncValue.loading();
    await _fetchCurrency();
  }
}
