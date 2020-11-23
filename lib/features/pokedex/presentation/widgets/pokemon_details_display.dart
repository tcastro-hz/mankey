import 'package:flutter/material.dart';
import 'package:hello_world/features/pokedex/domain/entities/pokemon.dart';

class PokemonDetailsDisplay extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailsDisplay({
    Key key,
    @required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: new SliverChildListDelegate( _buildList(pokemon.stats.length)));
  }

  List _buildList(int count) {
    List<Widget> listItems = List();
    for (int i = 0; i < count; i++) {
      listItems.add(new Padding(
          padding: new EdgeInsets.all(20.0),
          child: new Text(
              "${pokemon.stats[i].stat.name} - ${pokemon.stats[i].baseStat}")));
    }
    return listItems;
  }
}
