import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_pokedex/models/pokemon_model.dart';
//collections
import '../../../collections/color_by_type.dart';

class TypeCard extends StatelessWidget{
  TypeCard({
    super.key,
    required this.type
  });

  final PokemonType type;

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
    ColorByType colorByType = ColorByType();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: colorByType.getColorByType(type.name),
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