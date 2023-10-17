class Pokemon{
  final int id;
  final String name;
  final String imgURL;
  final List<dynamic> types;
  final List<dynamic> stats;

  Pokemon({
    required this.id,
    required this.name,
    required this.imgURL,
    required this.types,
    required this.stats
  });

  @override
  Map<String, dynamic> toJSON(){
    return{
      'id': id,
      'name': name,
      'imgURL': imgURL,
      //'types': types,
      'stats':stats
    };
  }

  factory Pokemon.fromJson(Map<String, dynamic> json){
    return Pokemon(
      id: json['id'], 
      name: json['name'], 
      imgURL: json['sprites']['other']['dream_world']['front_default'], 
      types: json['types'].map((type)=> Type(name: type['type']['name'])).toList(), 
      stats: json['stats'].map((stat)=> Stat(name: stat['stat']['name'], baseValue: stat['base_stat'])).toList()
    );
  }
}

class Stat{
  String name;
  int baseValue;

  Stat({
    required this.name,
    required this.baseValue
  });
}

class Type{
  String name;

  Type({
    required this.name
  });
}

class PokemonCard{
  String name;
  String infoURL;

  PokemonCard({
    required this.name,
    required this.infoURL
  });
}