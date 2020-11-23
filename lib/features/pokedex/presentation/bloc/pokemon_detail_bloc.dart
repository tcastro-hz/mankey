import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/core/errors/Failures.dart';
import 'package:hello_world/core/usecases/usecase.dart';
import 'package:hello_world/features/pokedex/domain/entities/pokemon.dart';
import 'package:hello_world/features/pokedex/domain/usecases/get_pokemon_details.dart';
import 'package:hello_world/features/pokedex/presentation/bloc/pokedex_bloc.dart';

part 'pokemon_detail_event.dart';
part 'pokemon_detail_state.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
 
final GetPokemonDetails getPokemonDetails;

 PokemonDetailBloc({
      @required GetPokemonDetails details
    })  :getPokemonDetails = details, super(Empty());


  @override
  Stream<PokemonDetailState> mapEventToState(
    PokemonDetailEvent event,
  ) async* {

    if (event is GetPokemonDetailsEvent) {
     yield Loading();
      final failureOrPokemon = await getPokemonDetails(Params(number:event.number));
      yield* _eitherLoadedOrErrorState(failureOrPokemon);
       
    }  
  } 
  Stream<PokemonDetailState> _eitherLoadedOrErrorState(
    Either<Failure, Pokemon> failureOrPokemonList,
  ) async* {
    yield failureOrPokemonList.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (pokemon) => Loaded(details: pokemon),
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









   

   

 

  

