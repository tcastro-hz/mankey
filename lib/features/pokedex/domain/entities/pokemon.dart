import 'package:equatable/equatable.dart';
import 'package:hello_world/features/pokedex/domain/entities/pokemon_stats.dart';
import 'package:meta/meta.dart';

class Pokemon extends Equatable {
  final String name;
  final List<PokemonStats> stats;


  Pokemon({
    @required this.name,
    @required this.stats
  });

  @override
  List<Object> get props => [name,stats];
}