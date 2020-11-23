import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/features/pokedex/domain/entities/pokemon_short_wrapper.dart';
import 'package:hello_world/features/pokedex/presentation/pages/pokedex_detail_page.dart';

class PokedexDisplay extends StatelessWidget {
  final PokemonShortWrapper pokemons;

  const PokedexDisplay({
    Key key,
    @required this.pokemons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Flexible(
      child: GridView.builder(
        itemCount: pokemons.results.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          // number of items on a row
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PokedexDetailPage(
                                index: pokemons.results[index].number,
                                name: pokemons.results[index].name,
                                imgUrl: pokemons.results[index].image)));
                  },
                  child: Stack(children: <Widget>[
                    Align(
                        alignment: FractionalOffset.center,
                        child: Hero(
                            tag: "hero-${pokemons.results[index].number}",
                            child: CachedNetworkImage(
                              imageUrl: pokemons.results[index].image,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ))),
                    Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Wrap(children: <Widget>[
                          Container(
                              color: Colors.blue[50],
                              child: Text(
                                pokemons.results[index].name,
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ))
                        ]))
                  ])));
        },
      ),
    );
  }
}
