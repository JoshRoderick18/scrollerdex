import 'package:get_it/get_it.dart';
import 'package:prueba_tecnica/core/services/http_service.dart';
import 'package:prueba_tecnica/data/repositories/pokemon_repository_implementation.dart';
import 'package:prueba_tecnica/domain/repositories/pokemon_repository.dart';
import 'package:stacked_services/stacked_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<SnackbarService>(
    () => SnackbarService(),
  );

  locator.registerLazySingleton<HttpService>(
    () => HttpService(),
  );

  locator.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImplementation(
      httpService: HttpService(),
    ),
  );
}
