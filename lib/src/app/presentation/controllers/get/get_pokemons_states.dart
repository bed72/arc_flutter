part of 'get_pokemons_controller.dart';

@immutable
abstract class GetPokemonsState extends Equatable {
  @override
  List<Object?> get props => [];
}

@immutable
class InitialGetPokemonsState extends GetPokemonsState {}

@immutable
class LoadingGetPokemonsState extends GetPokemonsState {}

@immutable
class SuccessGetPokemonsState extends GetPokemonsState {
  late final PokemonsEntity pokemons;

  SuccessGetPokemonsState(this.pokemons);

  @override
  List<Object?> get props => [
        pokemons,
      ];
}

@immutable
class FailureGetPokemonsState extends GetPokemonsState {
  late final String message;

  FailureGetPokemonsState(this.message);

  @override
  List<Object?> get props => [
        message,
      ];
}
