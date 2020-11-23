part of 'pokemon_detail_bloc.dart';

abstract class PokemonDetailState extends Equatable {
  const PokemonDetailState();
  
  @override
  List<Object> get props => [];
}

class PokemonDetailInitial extends PokemonDetailState {}
class Empty extends PokemonDetailState {}

class Loading extends PokemonDetailState {}

class Loaded extends PokemonDetailState {
  final Pokemon details;

  Loaded({@required this.details});

  @override
  List<Object> get props => [details];
}

class Error extends PokemonDetailState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}