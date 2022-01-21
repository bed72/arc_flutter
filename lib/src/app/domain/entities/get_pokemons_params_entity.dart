class GetPokemonsParamsEntity {
  late final int? limit;
  late final int? offset;
  late final String path;

  GetPokemonsParamsEntity({
    required this.path,
    required this.limit,
    required this.offset,
  });
}
