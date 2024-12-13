import 'package:currencia_app/core/providers/dio_provider.dart';
import 'package:currencia_app/data/repository/currency_repository_impl.dart';
import 'package:currencia_app/domain/repository/currency_repository.dart';
import 'package:currencia_app/domain/usecases/get_currency_usecase.dart';
import 'package:currencia_app/presentation/viewmdoels/currency_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/currency_remote_datasource.dart';
import '../../domain/model/currency_model.dart';

final currencyViewModelProvider =
    StateNotifierProvider<CurrencyViewModel, AsyncValue<CurrencyModel>>((ref) {
  final useCase = ref.read(getCurrencyUseCaseProvider);
  return CurrencyViewModel(useCase);
});

final getCurrencyUseCaseProvider = Provider<GetCurrencyUseCase>((ref) {
  final repository = ref.read(currencyRepositoryProvider);
  return GetCurrencyUseCase(repository: repository);
});

final currencyRepositoryProvider = Provider<CurrencyRepository>((ref) {
  final dataSource = ref.read(currencyRemoteDataSourceProvider);
  return CurrencyRepositoryImpl(remoteDataSource: dataSource);
});

final currencyRemoteDataSourceProvider =
    Provider<CurrencyRemoteDataSource>((ref) {
  final dio = ref.read(dioProvider);
  return CurrencyRemoteDataSource(dioClient: dio);
});
