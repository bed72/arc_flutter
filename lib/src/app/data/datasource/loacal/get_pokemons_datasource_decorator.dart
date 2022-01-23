import 'package:pokedex/src/app/domain/entities/pokemons_entity.dart';
import 'package:pokedex/src/app/domain/entities/get_pokemons_params_entity.dart';

import 'package:pokedex/src/app/data/datasource/get_pokemons_datasource.dart';

class GetPokemonsDataSourceDecorator implements GetPokemonsDataSource {
  final GetPokemonsDataSource _getPokemonsDataSource;

  GetPokemonsDataSourceDecorator(this._getPokemonsDataSource);

  @override
  Future<PokemonsEntity> call(GetPokemonsParamsEntity params) async {
    try {
      return await _getPokemonsDataSource(params);
    } catch (_) {
      rethrow;
    }
  }
}
