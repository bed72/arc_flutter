import 'package:flutter/foundation.dart';

import 'get_pokemons_states.dart';

import 'package:pokedex/src/app/domain/usecases/get/get_pokemons_usecase.dart';
import 'package:pokedex/src/app/domain/entities/get_pokemons_params_entity.dart';

class GetPokemonsController extends ValueNotifier<GetPokemonsState> {
  final GetPokemonsUseCase _getPokemonsUseCase;

  GetPokemonsController(
    this._getPokemonsUseCase,
  ) : super(InitialGetPokemonsState());

  Future<void> getPokemons(GetPokemonsParamsEntity params) async {
    value = LoadingGetPokemonsState();
    try {
      final pokemons = await _getPokemonsUseCase.call(params);

      value = SuccessGetPokemonsState(pokemons);
    } catch (error) {
      value = FailureGetPokemonsState(error.toString());
    }
  }
}
