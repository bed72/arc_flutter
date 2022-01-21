import 'dart:convert';

import 'package:http/http.dart';
import 'package:pokedex/src/app/domain/entities/get_pokemons_params_entity.dart';
import 'package:pokedex/src/app/domain/entities/pokemons_entity.dart';

import 'package:pokedex/src/app/data/models/pokemons_model.dart';
import 'package:pokedex/src/app/data/services/http/http_service.dart';
import 'package:pokedex/src/app/data/datasource/get_pokemons_datasource.dart';

class GetPokmonsRemoteDatasourceImpl implements GetPokemonsDataSource {
  final HttpService _httpService;

  GetPokmonsRemoteDatasourceImpl(
    this._httpService,
  );

  @override
  Future<PokemonsEntity> call(GetPokemonsParamsEntity params) async {
    try {
      final response = await _verifyTypeRequest(params);
      final json = jsonDecode(response.body);

      return PokemonsModel.fromJson(json);
    } on HttpService catch (_) {
      rethrow;
    }
  }

  Future<Response> _verifyTypeRequest(GetPokemonsParamsEntity params) async {
    if (params.limit == null || params.offset == null) {
      return await _httpService.get(url: params.path);
    } else {
      final url =
          '${params.path}?limit=${params.limit}&offset=${params.offset}';

      return await _httpService.get(url: url);
    }
  }
}
