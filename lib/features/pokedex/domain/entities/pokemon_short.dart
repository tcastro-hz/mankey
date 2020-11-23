import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PokemonShort extends Equatable {
  final String name;
  final String url;
  final String number;
  final String image;

  PokemonShort(
      {@required this.name, @required this.url, this.number, this.image});

  @override
  List<Object> get props => [name, url, number, image];

  static PokemonShort fromJson(Map<String, dynamic> json) {
    var name = json['name'];
    var url = json['url'];
    var splittedUrl = url.split("/");
    var numberFromUrl = splittedUrl.elementAt(splittedUrl.length - 2);
    if (numberFromUrl.length == 1) {
      numberFromUrl = "00$numberFromUrl";
    } else if (numberFromUrl.length == 2) {
      numberFromUrl = "0$numberFromUrl";
    }

    String image = "";
    if (numberFromUrl.length == 0) {
       image = "https://cdn.bulbagarden.net/upload/7/79/Dream_Pok%C3%A9_Ball_Sprite.png";
    } else {
      image =
          "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/$numberFromUrl.png";
    }

    return new PokemonShort(
        name: name, url: url, number: numberFromUrl, image: image);
  }
}
