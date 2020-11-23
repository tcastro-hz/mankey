import 'package:equatable/equatable.dart';
import 'package:hello_world/features/pokedex/domain/entities/pokemon_short.dart';
import 'package:meta/meta.dart';

class PokemonShortWrapper extends Equatable {

  final List<PokemonShort> results;
  final int count;
  final String next;
  final String previous;
 
 
  PokemonShortWrapper({
    @required this.results,
    @required this.count,
    this.next,
    this.previous 
  });

  @override
  List<Object> get props => [results,count,next,previous];
}