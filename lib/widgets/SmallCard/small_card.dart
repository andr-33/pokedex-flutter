import 'package:flutter/material.dart';
import 'package:mobile_pokedex/widgets/ImageSvg/image_svg.dart';
import 'package:mobile_pokedex/main.dart';
import 'package:mobile_pokedex/models/pokemon_model.dart';
import 'package:provider/provider.dart';
import 'package:string_capitalize/string_capitalize.dart';

class SmallCard extends StatelessWidget{
  SmallCard({
    super.key,
    required this.pokemonCard
  });

  final PokemonCard pokemonCard; 
  
  @override
  Widget build(BuildContext context){
    var appState = context.watch<MyAppState>();

    return GestureDetector(
      onTap:(){
         appState.selectedPokemon();
         appState.selectedPokemonName(pokemonCard.name);
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
                children:[
                  Positioned.fill(
                    child: Image.network("https://cdn.imgbin.com/13/20/18/imgbin-pok-ball-pok-mon-go-computer-icons-pokemon-go-ypKEEbx02zhFCsMwmbGN6vzxt.jpg")
                  ),
                  ImageSvg(name: pokemonCard.name, width: 90, height: 90,)
                ] 
              ),
              SizedBox(height: 10,),
              Text(pokemonCard.name.capitalize(),
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