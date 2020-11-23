import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:hello_world/core/network/network_info.dart';
import 'package:hello_world/features/pokedex/data/datasources/pokemon_remote_data_source.dart';
import 'package:hello_world/features/pokedex/data/repositories/pokemon_repository_impl.dart';
import 'package:hello_world/features/pokedex/domain/repositories/pokemon_repository.dart';
import 'package:hello_world/features/pokedex/domain/usecases/get_pokemon_details.dart';
import 'package:hello_world/features/pokedex/domain/usecases/get_pokemon_list.dart';
import 'package:hello_world/features/pokedex/presentation/bloc/pokedex_bloc.dart';
import 'package:hello_world/features/pokedex/presentation/bloc/pokemon_detail_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Pokedex
  // Bloc
  sl.registerFactory(
    () => PokedexBloc(
      pokemonList: sl(),
    ),
  );
  sl.registerFactory(
    () => PokemonDetailBloc(
      details: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetPokemonList(sl()));
  sl.registerLazySingleton(() => GetPokemonDetails(sl()));

  // Repository
  sl.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(client: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
