import 'package:flutter/material.dart';
import 'package:hello_world/features/pokedex/domain/entities/pokemon.dart';
import 'package:hello_world/features/pokedex/domain/entities/pokemon_stats.dart';

class PokemonDetailsModel extends Pokemon {
  
  final String name;
  final List<PokemonStats> stats;


  PokemonDetailsModel({
    @required this.name,
    @required this.stats
  }):super(name: name,stats: stats);
  
 
  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) {

    List<PokemonStats> stats = (json['stats'] as List)
        .map((itemResult) => PokemonStats.fromJson(itemResult))
        .toList(); 

    return PokemonDetailsModel( 
      name: (json['name']),
      stats: (stats));

  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'stats': stats
    };
  }
}