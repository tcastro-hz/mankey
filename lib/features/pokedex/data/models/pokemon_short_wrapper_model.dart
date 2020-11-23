import 'package:flutter/material.dart';
import 'package:hello_world/features/pokedex/domain/entities/pokemon_short.dart'; 
import 'package:hello_world/features/pokedex/domain/entities/pokemon_short_wrapper.dart';

class PokemonShortWrapperModel extends PokemonShortWrapper {

  final List<PokemonShort> results;
  final int count;
  final String next;
  final String previous;

  PokemonShortWrapperModel({
    @required this.results,
    @required this.count,
    this.next,
    this.previous
  }): super(results: results, count: count,next:next,previous:previous);
 

factory PokemonShortWrapperModel.fromJson(Map<String, dynamic> json) {
 // dynamic jsonResults = json['results'];  
   //List<PokemonShort> results = new List<PokemonShort>.from(jsonResults);


    List<PokemonShort> temp = (json['results'] as List)
        .map((itemResult) => PokemonShort.fromJson(itemResult))
        .toList();

    return PokemonShortWrapperModel(
      results: temp,
      count: (json['count']),
      next: (json['next']),
      previous: (json['previous']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'results': results,
      'count': count,
      'next': next,
      'previous': previous
    };
  }

}