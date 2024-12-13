import '../model/currency_model.dart';

abstract class CurrencyRepository {
  Future<CurrencyModel> getCurrencies();
}
