import 'package:flutter/material.dart';

import 'src/app.dart';

import 'package:pokedex/src/app/main/di/inject.dart';

import 'src/app/infrastructure/database/singleton/database_sigleton.dart';

Future<void> main() async {
  _setupInjetable();
  await _setupDatabase();

  runApp(const App());
}

void _setupInjetable() {
  WidgetsFlutterBinding.ensureInitialized();

  Inject.initialize();
}

Future<void> _setupDatabase() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DatabaseSingleton.instance.init();
}
