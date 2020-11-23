import 'dart:convert';
import 'package:hello_world/core/errors/exceptions.dart';
import 'package:hello_world/features/pokedex/data/models/pokemon_details_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hello_world/features/pokedex/data/models/pokemon_short_wrapper_model.dart';

abstract class PokemonRemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<PokemonShortWrapperModel> getPokemonList();
  Future<PokemonDetailsModel> getPokemonDetails(String number);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final http.Client client;

  PokemonRemoteDataSourceImpl({@required this.client});

  @override
  Future<PokemonShortWrapperModel> getPokemonList() => _getPokemonListFromUrl(
      'https://pokeapi.co/api/v2/pokemon/?limit=151&offset=0');

  Future<PokemonShortWrapperModel> _getPokemonListFromUrl(String url) async {
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return PokemonShortWrapperModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PokemonDetailsModel> getPokemonDetails(String number) =>
      _getPokemonDetailsFromUrl('https://pokeapi.co/api/v2/pokemon/${int.parse(number)}');

  Future<PokemonDetailsModel> _getPokemonDetailsFromUrl(String url) async {
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return PokemonDetailsModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
