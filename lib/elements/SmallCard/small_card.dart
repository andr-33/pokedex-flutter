import 'package:flutter/material.dart';
import 'package:mobile_pokedex/elements/ImageSvg/image_svg.dart';
import 'package:mobile_pokedex/models/pokemon_model.dart';
import 'package:string_capitalize/string_capitalize.dart';

class SmallCard extends StatelessWidget{
  SmallCard({
    super.key,
    required this.pokemonCard
  });

  final PokemonCard pokemonCard; 
  
  @override
  Widget build(BuildContext context){
    return Card(
      color: Colors.lightGreen,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageSvg(name: pokemonCard.name, width: 70, height: 70,),
          SizedBox(height: 10,),
          Text(pokemonCard.name.capitalize())
        ],
      ),
    );
  }
}