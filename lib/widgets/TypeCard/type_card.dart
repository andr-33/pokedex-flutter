import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_pokedex/models/pokemon_model.dart';

class TypeCard extends StatelessWidget{
  TypeCard({
    super.key,
    required this.type
  });

  final PokemonType type;

  int getColorByType(String type){
    
    final Map<String, int> color ={
      'normal': 0xFFA8A77A,
      'fire': 0xFFEE8130,
      'water': 0xFF6390F0,
      'electric': 0xFFF7D02C,
      'grass': 0xFF7AC74C,
      'ice': 0xFF96D9D6,
      'fighting': 0xFFC22E28,
      'poison': 0xFFA33EA1,
      'ground': 0xFFE2BF65,
      'flying': 0xFFA98FF3,
      'psychic': 0xFFF95587,
      'bug': 0xFFA6B91A,
      'rock': 0xFFB6A136,
      'ghost': 0xFF735797,
      'dragon': 0xFF6F35FC,
      'dark': 0xFF705746, 
      'steel': 0xFFB7B7CE, 
      'fairy': 0xFFD685AD
    };

    return color[type] ?? 0xFFE1E1E1;
  }

  File getIconByType(String type){
    final Map<String, File> icon ={
      'normal': File('lib/assets/icons/normal.svg'),
      'fire': File('lib/assets/icons/fire.svg'),
      'water': File('lib/assets/icons/water.svg'),
      'electric': File('lib/assets/icons/electric.svg'),
      'grass': File('lib/assets/icons/grass.svg'),
      'ice': File('lib/assets/icons/ice.svg'),
      'fighting': File('lib/assets/icons/fighting.svg'),
      'poison': File('lib/assets/icons/poison.svg'),
      'ground': File('lib/assets/icons/ground.svg'),
      'flying': File('lib/assets/icons/flying.svg'),
      'psychic': File('lib/assets/icons/psychic.svg'),
      'bug': File('lib/assets/icons/bug.svg'),
      'rock': File('lib/assets/icons/rock.svg'),
      'ghost': File('lib/assets/icons/ghost.svg'),
      'dragon': File('lib/assets/icons/dragon.svg'),
      'dark': File('lib/assets/icons/dark.svg'), 
      'steel': File('lib/assets/icons/steel.svg'), 
      'fairy': File('lib/assets/icons/fairy.svg')
    };

    return icon[type] ?? File('lib/assets/icons/normal.svg');
  }
  

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Color(getColorByType(type.name)),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Row(
          children:[ 
            SvgPicture.file(getIconByType(type.name), width: 20, height: 20,),
            SizedBox(width: 5),
            Text(type.name.toUpperCase(), 
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 20
              ),
            ),
          ]
        ),
      ),
    );
  }
}