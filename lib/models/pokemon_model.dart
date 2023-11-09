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
    required this.height,
    required this.weight,
    required this.types,
    required this.stats
  });

  Map<String, dynamic> toJSON(){
    return{
      'id': id,
      'name': name,
      'types': types,
      'stats':stats
    };
  }

  //Probar como usar estas funciones en factory
  double normalizeHeight(int heightInDecimeters){
    return heightInDecimeters / 10;
  }

  double normalizeWeight(int weightInGrams){
    return weightInGrams / 100;
  }

  factory Pokemon.fromJson(Map<String, dynamic> json){
    return Pokemon(
      id: json['id'], 
      name: json['name'],
      height: json['height'] / 10,
      weight: json['weight'] / 10, 
      types: json['types'].map((type)=> PokemonType(name: type['type']['name'])).toList(), 
      stats: json['stats'].map((stat)=> Stat(originalName: stat['stat']['name'], baseValue: stat['base_stat'])).toList()
    );
  }
}

class Stat{
  String name;
  int baseValue;

  Stat({
    required String originalName,
    required this.baseValue
  }): name = changeStatName(originalName);

  static String changeStatName(String name){
    final Map<String, String> namesToBeChanged = {
      "special-attack": "special Attack",
      "special-defense": "special Defense"
    }; 

    return namesToBeChanged[name] ?? name;
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