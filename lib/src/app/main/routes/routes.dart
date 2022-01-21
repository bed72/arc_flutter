import 'package:flutter/material.dart';

import 'package:pokedex/src/app/presentation/screens/home_screen.dart';
import 'package:pokedex/src/app/main/utils/constants/app_constants.dart';

class Routes {
  static Route<MaterialPageRoute> generateRoute(RouteSettings settings) {
    late final Widget _widget;
    // ignore: unused_local_variable
    late final _args = settings.arguments;

    switch (settings.name) {
      case Constants.routeHome:
        _widget = const HomeScreen();
        break;
      default:
        _widget = Container();
    }

    return MaterialPageRoute(builder: (BuildContext context) => _widget);
  }
}
