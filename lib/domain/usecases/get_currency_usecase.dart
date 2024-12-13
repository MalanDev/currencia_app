import 'package:currencia_app/domain/model/currency_model.dart';
import 'package:currencia_app/domain/repository/currency_repository.dart';

class GetCurrencyUseCase {
  final CurrencyRepository repository;

  GetCurrencyUseCase({required this.repository});

  Future<CurrencyModel> call() async {
    return await repository.getCurrencies();
  }
}
