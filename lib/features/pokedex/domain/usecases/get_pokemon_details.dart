import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/core/errors/Failures.dart';
import 'package:hello_world/core/usecases/usecase.dart';
import 'package:hello_world/features/pokedex/domain/entities/pokemon.dart';
import 'package:hello_world/features/pokedex/domain/repositories/pokemon_repository.dart';

class GetPokemonDetails implements UseCase<Pokemon, Params> {
  final PokemonRepository repository;

  GetPokemonDetails(this.repository);

  @override
  Future<Either<Failure, Pokemon>> call(Params params) async { 
    return await repository.getPokemonDetails(params.number);
  }
}

class Params extends Equatable {
  final String number;

  Params({@required this.number});

  @override
  List<Object> get props => [number];
}
