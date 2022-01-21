import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final String url;
  final String name;

  const PokemonEntity({
    required this.url,
    required this.name,
  });

  @override
  List<Object?> get props => [
        url,
        name,
      ];
}
