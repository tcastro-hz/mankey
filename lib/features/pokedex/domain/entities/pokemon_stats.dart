import 'package:hello_world/features/pokedex/domain/entities/stat.dart';

class PokemonStats {
int baseStat;
  int effort;
  Stat stat;

  PokemonStats({this.baseStat, this.effort, this.stat});

  PokemonStats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = json['stat'] != null ? new Stat.fromJson(json['stat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base_stat'] = this.baseStat;
    data['effort'] = this.effort;
    if (this.stat != null) {
      data['stat'] = this.stat.toJson();
    }
    return data;
  }

}