import 'package:pokedex/src/app/data/models/pokemon_model.dart';
import 'package:sqflite/sqflite.dart';

import 'package:pokedex/src/app/domain/entities/pokemons_entity.dart';

import 'package:pokedex/src/app/main/utils/constants/app_quries.dart';

import 'package:pokedex/src/app/data/models/pokemons_model.dart';
import 'package:pokedex/src/app/data/services/database/database_service.dart';

class DatabaseServiceImpl implements DatabaseService {
  late final Database database;

  DatabaseServiceImpl(this.database);

  @override
  Future<void> delete() async {
    await database.delete(Queries.databasePokemons);
  }

  @override
  Future<PokemonsEntity> get() async {
    final values = await database.query(Queries.databasePokemons);
    final pokemons = <String, dynamic>{
      'next': '',
      'previous': '',
      'count': values.length,
      'results': values
          .map((pokemon) => PokemonModel.fromJson(pokemon).toJson())
          .toList(),
    };

    return PokemonsModel.fromJson(pokemons);
  }

  @override
  Future<void> save({
    required PokemonsEntity value,
  }) async {
    // await delete();

    for (var pokemon in value.results) {
      await database.rawInsert(
        Queries.databaseQueryInsertPokemons,
        [pokemon.url, pokemon.name],
      );
    }
  }
}
