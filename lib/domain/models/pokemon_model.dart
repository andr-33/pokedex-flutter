import 'package:mobile_pokedex/domain/models/stat_model.dart';

class Pokemon{
  final int id;
  final String name;
  final double height;
  final double weight;
  final List<dynamic> types;
  final List<dynamic> stats;

  Pokemon({
    required this.id,
    required this.name,
    required int apiHeight,
    required int apiWeight,
    required this.types,
    required this.stats
  }):
  height = normalizeHeight(apiHeight), 
  weight = normalizeWeight(apiWeight);

  static double normalizeHeight(int heightInDecimeters){
    return heightInDecimeters / 10;
  }

  static double normalizeWeight(int weightInGrams){
    return weightInGrams/10;
  }

  factory Pokemon.fromJson(Map<String, dynamic> json){
    return Pokemon(
      id: json['id'], 
      name: json['name'],
      apiHeight: json['height'],
      apiWeight: json['weight'], 
      types: json['types'].map((type)=> PokemonType(name: type['type']['name'])).toList(), 
      stats: json['stats'].map((stat)=> Stat(originalName: stat['stat']['name'], baseValue: stat['base_stat'])).toList()
    );
  }
}

class PokemonType{
  String name;

  PokemonType({
    required this.name
  });
}

class PokemonCard{
  String name;
  String infoURL;

  PokemonCard({
    required  this.name,
    required this.infoURL
  });
}