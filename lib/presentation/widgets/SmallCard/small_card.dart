import 'package:flutter/material.dart';
import 'package:mobile_pokedex/presentation/provider/pokemon_provider.dart';
import 'package:mobile_pokedex/presentation/widgets/PokemonImageSvg/pokemon_image_svg.dart';
import 'package:provider/provider.dart';
import 'package:string_capitalize/string_capitalize.dart';

class SmallCard extends StatelessWidget{
  SmallCard({
    super.key,
    required this.name
  });

  final String name; 
  
  @override
  Widget build(BuildContext context){
    final pokemonProvider = context.watch<PokemonProvider>();

    return GestureDetector(
      onTap:(){
         pokemonProvider.selectedPokemon();
         pokemonProvider.selectedPokemonName(name);
      } ,
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.blueGrey[200],
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children:[
                  Image.network(
                    "https://cdn-icons-png.flaticon.com/512/1068/1068729.png", 
                    width: 150,
                    height: 150,
                    color: Colors.white70, 
                    opacity: AlwaysStoppedAnimation(0.4),
                  ),
                  PokemonImageSvg(name: name, width: 100, height: 100,)
                ] 
              ),
              SizedBox(height: 10,),
              Text(name.capitalize(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70
                ),
              )
            ],
          ),
      )
    );
  }
}