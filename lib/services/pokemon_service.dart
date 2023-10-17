import 'package:http/http.dart' as http;
import 'dart:convert';

//models
import '../models/pokemon_model.dart';

Future<Pokemon> getPokemon() async{
  final res = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/bulbasaur'));
  
  if(res.statusCode == 200){
    return Pokemon.fromJson(jsonDecode(res.body));
  }
  else{
    throw Exception("Failed to get pokemon's data");
  }
}

Future<String> getPokemonImage(int id) async{
  final res = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'));

  if(res.statusCode == 200){
    return jsonDecode(res.body)['sprites']['other']['dream_world']['front_default'];
  }
  else{
    throw Exception("Failed to get pokemon image");
  }
}

Future<List<dynamic>> getAllPokemons() async{
  final res = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=50'));

  if(res.statusCode == 200){
    return jsonDecode(res.body)['results'].map((result)=> PokemonCard(name: result['name'], infoURL: result['url'])).toList();
  }
  else{
    throw Exception('Failed to get pokemos data');
  }

}