import 'package:flutter/foundation.dart';

import 'package:pokedex/src/app/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/app/domain/usecases/get/get_pokemons_usecase.dart';
import 'package:pokedex/src/app/domain/entities/get_pokemons_params_entity.dart';
import 'package:pokedex/src/app/main/utils/constants/app_constants.dart';

import 'package:pokedex/src/app/presentation/controllers/base/base_controller.dart';

class GetPokemonsPagingController extends ChangeNotifier
    implements BaseController<List<PokemonEntity>> {
  final GetPokemonsUseCase _getPokemonsUseCase;

  GetPokemonsPagingController(
    this._getPokemonsUseCase,
  );

  bool _loading = false;
  bool get loading => _loading;
  @override
  Future<void> setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  String _error = '';
  String get error => _error;
  @override
  Future<void> setError(String error) async {
    _error = error;
    notifyListeners();
  }

  List<PokemonEntity> _pokemons = const <PokemonEntity>[];
  List<PokemonEntity> get pokemons => _pokemons;
  @override
  Future<void> setSuccessful(List<PokemonEntity> value) async {
    _pokemons += value;

    notifyListeners();
  }

  String handleUrlImagePokemons({required int index}) {
    if (index < 10) {
      return '${Constants.imageURL}00$index.png';
    } else if (index > 9 && index < 100) {
      return '${Constants.imageURL}0$index.png';
    } else {
      return '${Constants.imageURL}$index.png';
    }
  }

  Future<void> getNextPage(GetPokemonsParamsEntity params) async {
    try {
      final pokemons = await _getPokemonsUseCase.call(params);

      setSuccessful(pokemons.results);
    } catch (error) {
      setError(error.toString());
    }
  }
}
