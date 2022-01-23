import 'package:get_it/get_it.dart';

import 'package:pokedex/src/app/domain/usecases/get/get_pokemons_usecase.dart';
import 'package:pokedex/src/app/domain/repositories/get_pokemons_repository.dart';
import 'package:pokedex/src/app/domain/usecases/get/get_pokemons_usecase_impl.dart';

import 'package:pokedex/src/app/infrastructure/http/services/http_service_impl.dart';
import 'package:pokedex/src/app/infrastructure/http/interceptors/http_interceptor.dart';
import 'package:pokedex/src/app/infrastructure/database/singleton/database_sigleton.dart';
import 'package:pokedex/src/app/infrastructure/database/services/database_service_impl.dart';

import 'package:pokedex/src/app/presentation/controllers/get/get_pokemons_controller.dart';
import 'package:pokedex/src/app/presentation/controllers/paging/get_pokemons_paging_controller.dart';

import 'package:pokedex/src/app/data/services/http/http_service.dart';
import 'package:pokedex/src/app/data/services/database/database_service.dart';
import 'package:pokedex/src/app/data/datasource/get_pokemons_datasource.dart';
import 'package:pokedex/src/app/data/repositories/get_pokemons_repository_impl.dart';
import 'package:pokedex/src/app/data/datasource/remote/get_pokemons_remote_datasource_impl.dart';
import 'package:pokedex/src/app/data/datasource/loacal/get_pokemons_local_datasource_decorator_impl.dart';

class Inject {
  static initialize() {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<HttpInterceptor>(() => HttpInterceptor());

    // Services
    getIt.registerLazySingleton<HttpService>(
      () => HttpServiceImpl(
        getIt<HttpInterceptor>(),
      ),
    );
    getIt.registerLazySingleton(
      () => getIt<DatabaseSingleton>(),
    );

    getIt.registerLazySingleton<DatabaseService>(
      () => DatabaseServiceImpl(DatabaseSingleton.instance.database),
    );

    getIt.registerLazySingleton<GetPokemonsDataSource>(
      () => GetPokemonsLocalDataSourceDecoratorImpl(
        GetPokmonsRemoteDatasourceImpl(
          getIt<HttpService>(),
        ),
        getIt<DatabaseService>(),
      ),
    );

    // Repositories
    getIt.registerLazySingleton<GetPokemonsRepository>(
      () => GetPokemonsRepositoryImpl(
        getIt<GetPokemonsDataSource>(),
      ),
    );

    // USeCases
    getIt.registerLazySingleton<GetPokemonsUseCase>(
      () => GetPokemonsUseCaseImpl(
        getIt<GetPokemonsRepository>(),
      ),
    );

    // Controllers
    getIt.registerLazySingleton<GetPokemonsController>(
      () => GetPokemonsController(
        getIt<GetPokemonsUseCase>(),
      ),
    );

    getIt.registerLazySingleton<GetPokemonsPagingController>(
      () => GetPokemonsPagingController(
        getIt<GetPokemonsUseCase>(),
      ),
    );
  }
}
