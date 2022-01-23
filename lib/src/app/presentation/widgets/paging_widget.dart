import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:pokedex/src/app/main/utils/constants/app_constants.dart';

import 'package:pokedex/src/app/domain/entities/pokemons_entity.dart';
import 'package:pokedex/src/app/domain/entities/get_pokemons_params_entity.dart';

import 'package:pokedex/src/app/presentation/widgets/error_widget.dart';
import 'package:pokedex/src/app/presentation/widgets/load_widget.dart';

import 'package:pokedex/src/app/infrastructure/database/singleton/database_sigleton.dart';

import 'package:pokedex/src/app/presentation/widgets/staggered_grid_view_widget.dart';
import 'package:pokedex/src/app/presentation/controllers/paging/get_pokemons_paging_controller.dart';

class PagingWidget extends StatefulWidget {
  final PokemonsEntity pokemons;

  const PagingWidget({
    Key? key,
    required this.pokemons,
  }) : super(key: key);

  @override
  State<PagingWidget> createState() => _PagingWidgetState();
}

class _PagingWidgetState extends State<PagingWidget> {
  late final _offset = 0;
  late final _limit = 19;

  late ScrollController _scrollController;
  late final GetPokemonsPagingController _controller;

  @override
  void initState() {
    super.initState();

    _setupController();
    _setupScrollController();
    _setupPokemons(widget.pokemons);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    DatabaseSingleton.instance.database.close();

    super.dispose();
  }

  void _setupController() {
    _controller = GetIt.instance.get<GetPokemonsPagingController>();
  }

  void _setupScrollController() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _setupPokemons(PokemonsEntity pokemons) {
    _controller.setSuccessful(pokemons.results);
  }

  void _getNextPaging({required int offset}) {
    _controller.getNextPage(
      GetPokemonsParamsEntity(
        limit: _limit,
        offset: offset,
        path: '${Constants.baseURL}pokemon/',
      ),
    );
  }

  dynamic _scrollListener() {
    int next = _offset + 10;
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _getNextPaging(offset: next);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        if (_controller.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (_controller.error.isNotEmpty) {
          return Center(
            child: Text(_controller.error),
          );
        }

        return StaggeredGridViewWidget(
          aspectRatio: 1,
          offsetPercent: 0.2,
          controller: _scrollController,
          itemCount: _controller.pokemons.length,
          indexedWidgetBuilder: (_, index) {
            final pokemons = _controller.pokemons[index];

            return Card(
              elevation: 4.0,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: CachedNetworkImage(
                      imageUrl:
                          _controller.handleUrlImagePokemons(index: index + 1),
                      placeholder: (_, __) => loadWiget(),
                      errorWidget: (_, __, ___) => errorIconWidget(),
                    ),
                  ),
                  Expanded(
                    child: Text(pokemons.name),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
