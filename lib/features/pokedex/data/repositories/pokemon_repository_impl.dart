import 'package:dartz/dartz.dart';
import 'package:hello_world/features/pokedex/data/models/pokemon_details_model.dart'; 
import 'package:meta/meta.dart';

import 'package:hello_world/core/errors/Failures.dart';
import 'package:hello_world/core/errors/exceptions.dart';
import 'package:hello_world/features/pokedex/data/datasources/pokemon_remote_data_source.dart';
import 'package:hello_world/features/pokedex/data/models/pokemon_short_wrapper_model.dart';
import 'package:hello_world/features/pokedex/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl({@required this.remoteDataSource});

  @override
  Future<Either<Failure, PokemonShortWrapperModel>> getPokemonList() async {
    return await _getPokemon(() {
      return remoteDataSource.getPokemonList();
    });
  }

  Future<Either<Failure, PokemonShortWrapperModel>> _getPokemon(
      Future<PokemonShortWrapperModel> Function() param0) async {
    try {
      final pokemonList = await remoteDataSource.getPokemonList();
      return Right(pokemonList);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PokemonDetailsModel>> getPokemonDetails(String number) async {
    try {
      final pokemonDetails = await remoteDataSource.getPokemonDetails(number);
      return Right(pokemonDetails);
    } on ServerException {
      return Left(ServerFailure());
    }
  }


}
