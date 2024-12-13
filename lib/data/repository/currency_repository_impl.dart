import 'dart:convert';

import 'package:currencia_app/data/datasources/currency_remote_datasource.dart';
import 'package:currencia_app/domain/model/currency_model.dart';
import 'package:currencia_app/domain/repository/currency_repository.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final CurrencyRemoteDataSource remoteDataSource;

  CurrencyRepositoryImpl({required this.remoteDataSource});

  @override
  Future<CurrencyModel> getCurrencies() async {
    final data = await remoteDataSource.fetchCurrencyData();
    return currencyModelFromJson(jsonEncode(data));
  }
}
