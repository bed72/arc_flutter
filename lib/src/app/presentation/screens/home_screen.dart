import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import 'package:pokedex/src/app/main/utils/constants/app_constants.dart';

import 'package:pokedex/src/app/domain/entities/get_pokemons_params_entity.dart';

import 'package:pokedex/src/app/presentation/widgets/paging_widget.dart';
import 'package:pokedex/src/app/presentation/controllers/get/get_pokemons_states.dart';
import 'package:pokedex/src/app/presentation/controllers/get/get_pokemons_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final _offset = 0;
  late final _limit = 20;
  late final GetPokemonsController _controller;

  @override
  void initState() {
    super.initState();

    _setupController();

    _getPokemons();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  void _setupController() {
    _controller = GetIt.instance.get<GetPokemonsController>();
  }

  void _getPokemons() {
    _controller.getPokemons(
      GetPokemonsParamsEntity(
        limit: _limit,
        offset: _offset,
        path: '${Constants.baseURL}pokemon/',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemons'),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: _controller,
          builder: (_, state, child) {
            if (state is LoadingGetPokemonsState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is FailureGetPokemonsState) {
              return Center(
                child: Text(state.message),
              );
            }

            return PagingWidget(
              pokemons: (state as SuccessGetPokemonsState).pokemons,
            );
          },
        ),
      ),
    );
  }
}
