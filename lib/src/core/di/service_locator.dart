import 'package:coin_cap_test/src/feature/coins/data/repo/coins_repository_impl.dart';
import 'package:coin_cap_test/src/feature/coins/domain/bloc/coins_bloc.dart';
import 'package:coin_cap_test/src/feature/coins/domain/repo/coins_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Регистрация repository
  getIt.registerLazySingleton<CoinsRepository>(() => CoinsRepositoryImpl());
  // Регистрация BLoC
  getIt.registerLazySingleton(() => CoinsBloc(getIt()));
}
