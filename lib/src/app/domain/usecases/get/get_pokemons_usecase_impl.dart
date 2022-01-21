import 'package:pokedex/src/app/domain/helpers/http_helpers.dart';
import 'package:pokedex/src/app/domain/entities/pokemons_entity.dart';
import 'package:pokedex/src/app/domain/usecases/get/get_pokemons_usecase.dart';
import 'package:pokedex/src/app/domain/entities/get_pokemons_params_entity.dart';
import 'package:pokedex/src/app/domain/repositories/get_pokemons_repository.dart';

class GetPokemonsUseCaseImpl implements GetPokemonsUseCase {
  final GetPokemonsRepository _getPokemonsRepository;

  GetPokemonsUseCaseImpl(this._getPokemonsRepository);

  @override
  Future<PokemonsEntity> call(GetPokemonsParamsEntity params) async {
    try {
      return await _getPokemonsRepository(params);
    } on HttpError catch (_) {
      rethrow;
    }
  }
}
