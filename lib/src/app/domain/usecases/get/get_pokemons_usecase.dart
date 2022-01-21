import 'package:pokedex/src/app/domain/entities/pokemons_entity.dart';
import 'package:pokedex/src/app/domain/entities/get_pokemons_params_entity.dart';

abstract class GetPokemonsUseCase {
  Future<PokemonsEntity> call(GetPokemonsParamsEntity params);
}
