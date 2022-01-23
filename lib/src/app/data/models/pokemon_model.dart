import 'package:pokedex/src/app/domain/entities/pokemon_entity.dart';

extension PokemonModel on PokemonEntity {
  static PokemonEntity fromJson(Map<String, dynamic> json) {
    return PokemonEntity(
      url: json['url'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'url': url,
        'name': name,
      };
}
