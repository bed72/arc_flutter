import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pokedex/src/app/main/utils/constants/app_quries.dart';

class DatabaseSingleton {
  DatabaseSingleton._();

  late final Database _database;

  static final DatabaseSingleton _instance = DatabaseSingleton._();
  static DatabaseSingleton get instance => _instance;

  factory DatabaseSingleton() {
    return _instance;
  }

  Future<void> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, Queries.databaseName);

    _database = await openDatabase(
      path,
      version: 1,
      onOpen: (db) {
        print('\n\n DATABASE: $db \n\n');
      },
      onCreate: (db, version) async {
        await db.execute(Queries.databaseQueryCreateTablePokemons);
        print('\n\n CREATED DATABASE: $db VERSION: $version \n\n');
      },
      onConfigure: (db) async {
        await db.execute(Queries.dataBaseConfig);
        print('\n\n CONFIGURED DATABASE: $db \n\n');
      },
    );
  }

  Database get database => _database;
}
