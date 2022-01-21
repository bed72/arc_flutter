import 'package:pokedex/src/app/domain/entities/pokemons_entity.dart';

abstract class GetPokemonsState {}

class InitialGetPokemonsState extends GetPokemonsState {}

class LoadingGetPokemonsState extends GetPokemonsState {}

class SuccessGetPokemonsState extends GetPokemonsState {
  late final PokemonsEntity pokemons;

  SuccessGetPokemonsState(this.pokemons);
}

class FailureGetPokemonsState extends GetPokemonsState {
  late final String message;

  FailureGetPokemonsState(this.message);
}
