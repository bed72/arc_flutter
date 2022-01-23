import 'package:pokedex/src/app/domain/entities/pokemons_entity.dart';

abstract class DatabaseService {
  Future<void> delete();

  Future<PokemonsEntity> get();

  Future<void> save({
    required PokemonsEntity value,
  });
}
