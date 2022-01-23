class Queries {
  static const String databaseName = 'pokemons.db';
  static const String databasePokemons = 'pokemons';
  static const String dataBaseConfig = 'PRAGMA foreign_keys = ON';

  static const String databaseQueryCreateTablePokemons = '''
     CREATE TABLE IF NOT EXISTS $databasePokemons (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            url TEXT NOT NULL,
            name TEXT NOT NULL
          );
  ''';

  static const String databaseQueryInsertPokemons =
      'INSERT INTO $databasePokemons (url, name) VALUES (?, ?);';
}
