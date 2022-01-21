import 'package:pokedex/src/app/data/models/pokemon_model.dart';
import 'package:pokedex/src/app/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/app/domain/entities/pokemons_entity.dart';

extension PokemonsModel on PokemonsEntity {
  static PokemonsEntity fromJson(Map<String, dynamic> json) {
    return PokemonsEntity(
      next: json['next'],
      previous: json['previous'],
      count: json['count'] as int,
      results: _toList(json['results']),
    );
  }

  static List<PokemonEntity> _toList(List<dynamic> results) =>
      results.map((json) => PokemonModel.fromJson(json)).toList();
}
