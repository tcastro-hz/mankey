 

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PokedexEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetPokemonListEvent extends PokedexEvent {  
  GetPokemonListEvent();

  @override
  List<Object> get props => [];
}
