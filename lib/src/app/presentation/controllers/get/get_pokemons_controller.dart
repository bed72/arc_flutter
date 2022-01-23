import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedex/src/app/domain/entities/pokemons_entity.dart';

import 'package:pokedex/src/app/domain/usecases/get/get_pokemons_usecase.dart';
import 'package:pokedex/src/app/domain/entities/get_pokemons_params_entity.dart';

part 'get_pokemons_states.dart';

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
