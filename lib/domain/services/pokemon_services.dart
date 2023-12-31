import 'package:http/http.dart' as http;
import 'dart:convert';

//models
import '../models/pokemon_model.dart';

Future<Pokemon> getPokemonByName(String name) async{
  final res = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));
  
  if(res.statusCode == 200){
    return Pokemon.fromJson(jsonDecode(res.body));
  }
  else{
    throw Exception("Failed to get pokemon's data");
  }
}

Future<String> getPokemonImage(String name) async{
  final res = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));

  if(res.statusCode == 200){
    return jsonDecode(res.body)['sprites']['other']['dream_world']['front_default'];
  }
  else{
    throw Exception("Failed to get pokemon image");
  }
}

Future<List<dynamic>> getAllPokemons(int offset) async{
  final res = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?offset=$offset&limit=20'));

  if(res.statusCode == 200){
    return jsonDecode(res.body)['results'].map((result)=> result['name']).toList();
  }
  else{
    throw Exception('Failed to get pokemos data');
  }

}