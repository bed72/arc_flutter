import 'package:pokedex/src/app/data/datasource/get_pokemons_datasource.dart';

import 'package:pokedex/src/app/domain/helpers/http_helpers.dart';
import 'package:pokedex/src/app/domain/entities/pokemons_entity.dart';
import 'package:pokedex/src/app/domain/entities/get_pokemons_params_entity.dart';
import 'package:pokedex/src/app/domain/repositories/get_pokemons_repository.dart';

class GetPokemonsRepositoryImpl implements GetPokemonsRepository {
  final GetPokemonsDataSource _getPokemonsDataSource;

  GetPokemonsRepositoryImpl(
    this._getPokemonsDataSource,
  );

  @override
  Future<PokemonsEntity> call(GetPokemonsParamsEntity params) async {
    try {
      return await _getPokemonsDataSource(params);
    } on HttpError catch (_) {
      rethrow;
    }
  }
}
