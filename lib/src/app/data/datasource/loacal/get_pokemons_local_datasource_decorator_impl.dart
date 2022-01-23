import 'package:pokedex/src/app/domain/entities/pokemons_entity.dart';
import 'package:pokedex/src/app/domain/entities/get_pokemons_params_entity.dart';

import 'package:pokedex/src/app/data/services/database/database_service.dart';
import 'package:pokedex/src/app/data/datasource/get_pokemons_datasource.dart';
import 'package:pokedex/src/app/data/datasource/loacal/get_pokemons_datasource_decorator.dart';

class GetPokemonsLocalDataSourceDecoratorImpl
    extends GetPokemonsDataSourceDecorator {
  final DatabaseService _databaseService;

  GetPokemonsLocalDataSourceDecoratorImpl(
    GetPokemonsDataSource getPokemonsDataSource,
    this._databaseService,
  ) : super(getPokemonsDataSource);

  @override
  Future<PokemonsEntity> call(GetPokemonsParamsEntity params) async {
    try {
      final response = (await super(params));

      _databaseService.save(value: response);

      return response;
    } catch (_) {
      final pokemons = await _databaseService.get();

      return pokemons;
    }
  }
}
