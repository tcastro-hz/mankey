import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/core/errors/Failures.dart';
import 'package:hello_world/core/usecases/usecase.dart';
import 'package:hello_world/features/pokedex/domain/entities/pokemon_short_wrapper.dart';
import 'package:hello_world/features/pokedex/domain/usecases/get_pokemon_list.dart'; 
import 'package:hello_world/features/pokedex/presentation/bloc/pokedex_state.dart'; 
import 'package:hello_world/features/pokedex/presentation/bloc/pokedex_event.dart'; 
  

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
    final GetPokemonList getPokemonList;

    PokedexBloc({
      @required GetPokemonList pokemonList
    })  :getPokemonList = pokemonList, super(Empty());

  
  @override
  Stream<PokedexState> mapEventToState(
    PokedexEvent event,
  ) async* {
     

    if (event is GetPokemonListEvent) {
     yield Loading();
      final failureOrPokemonList = await getPokemonList(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrPokemonList);
       
    }  
  }

    Stream<PokedexState> _eitherLoadedOrErrorState(
    Either<Failure, PokemonShortWrapper> failureOrPokemonList,
  ) async* {
    yield failureOrPokemonList.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (pokemon) => Loaded(pokemons: pokemon),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;       
      default:
        return 'Unexpected error';
    }
  }
}
