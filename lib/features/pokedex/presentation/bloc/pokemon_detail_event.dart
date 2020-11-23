part of 'pokemon_detail_bloc.dart';

abstract class PokemonDetailEvent extends Equatable {
  const PokemonDetailEvent();

  @override
  List<Object> get props => [];
}
class GetPokemonDetailsEvent extends PokemonDetailEvent {  
  final String number;
  GetPokemonDetailsEvent(this.number);

  @override
  List<Object> get props => [number];
}
