import 'package:dartz/dartz.dart';
import 'package:hello_world/core/errors/Failures.dart';
import 'package:hello_world/features/pokedex/domain/entities/pokemon.dart';
import 'package:hello_world/features/pokedex/domain/entities/pokemon_short_wrapper.dart';
 

abstract class PokemonRepository {
  Future<Either<Failure, Pokemon>> getPokemonDetails(String number);
 
  Future<Either<Failure, PokemonShortWrapper>> getPokemonList();
}