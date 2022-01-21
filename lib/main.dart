import 'package:flutter/material.dart';

import 'src/app.dart';

import 'package:pokedex/src/app/main/di/inject.dart';

void main() {
  Inject.initialize();

  runApp(const MyApp());
}
