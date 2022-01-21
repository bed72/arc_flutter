import 'package:equatable/equatable.dart';
import 'package:pokedex/src/app/domain/entities/pokemon_entity.dart';

class PokemonsEntity extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonEntity> results;

  const PokemonsEntity({
    required this.next,
    required this.count,
    required this.results,
    required this.previous,
  });

  const PokemonsEntity.empty({
    this.next = '',
    this.count = 0,
    this.previous = '',
    this.results = const <PokemonEntity>[],
  });

  @override
  List<Object?> get props => [
        count,
        next,
        results,
        previous,
      ];
}
