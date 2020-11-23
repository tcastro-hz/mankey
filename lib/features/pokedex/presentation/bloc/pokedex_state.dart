 
import 'package:equatable/equatable.dart';
import 'package:hello_world/features/pokedex/domain/entities/pokemon_short_wrapper.dart';
import 'package:meta/meta.dart';
 
 
@immutable
abstract class PokedexState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends PokedexState {}

class Loading extends PokedexState {}

class Loaded extends PokedexState {
  final PokemonShortWrapper pokemons;

  Loaded({@required this.pokemons});

  @override
  List<Object> get props => [pokemons];
}

class Error extends PokedexState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}