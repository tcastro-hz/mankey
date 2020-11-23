import 'package:dartz/dartz.dart';
import 'package:hello_world/core/errors/Failures.dart';
import 'package:hello_world/features/pokedex/domain/entities/pokemon_short_wrapper.dart';
import 'package:hello_world/features/pokedex/domain/repositories/pokemon_repository.dart';
 
import '../../../../core/usecases/usecase.dart';  

class GetPokemonList implements UseCase<PokemonShortWrapper, NoParams> {
  final PokemonRepository repository;

  GetPokemonList(this.repository);

  @override
  Future<Either<Failure, PokemonShortWrapper>> call(NoParams params) async {
    return await repository.getPokemonList();
  }
}

 