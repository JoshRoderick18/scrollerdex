import 'package:get_it/get_it.dart';
import 'package:scrollerdex/core/services/http_service.dart';
import 'package:scrollerdex/core/services/shared_preferences_service.dart';
import 'package:scrollerdex/data/repositories/pokemon_repository_implementation.dart';
import 'package:scrollerdex/domain/repositories/pokemon_repository.dart';
import 'package:stacked_services/stacked_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  locator.registerLazySingleton<SharedPreferencesService>(
    () => SharedPreferencesService(),
  );

  locator.registerLazySingleton<SnackbarService>(
    () => SnackbarService(),
  );

  locator.registerLazySingleton<HttpService>(
    () => HttpService(),
  );

  locator.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImplementation(
      httpService: HttpService(),
      sharedPreferencesService: SharedPreferencesService(),
    ),
  );
}
