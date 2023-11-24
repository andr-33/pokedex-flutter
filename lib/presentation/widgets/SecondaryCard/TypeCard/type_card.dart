import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_pokedex/domain/models/pokemon_model.dart';
//collections
import '../../../../domain/collections/color_by_type.dart';

class TypeCard extends StatelessWidget{
  TypeCard({
    super.key,
    required this.type
  });

  final PokemonType type;

  String getIconByType(String type){
    final Map<String, String> icon ={
      'normal': 'lib/assets/icons/normal.svg',
      'fire': 'lib/assets/icons/fire.svg',
      'water': 'lib/assets/icons/water.svg',
      'electric': 'lib/assets/icons/electric.svg',
      'grass': 'lib/assets/icons/grass.svg',
      'ice': 'lib/assets/icons/ice.svg',
      'fighting': 'lib/assets/icons/fighting.svg',
      'poison': 'lib/assets/icons/poison.svg',
      'ground': 'lib/assets/icons/ground.svg',
      'flying': 'lib/assets/icons/flying.svg',
      'psychic': 'lib/assets/icons/psychic.svg',
      'bug': 'lib/assets/icons/bug.svg',
      'rock': 'lib/assets/icons/rock.svg',
      'ghost': 'lib/assets/icons/ghost.svg',
      'dragon': 'lib/assets/icons/dragon.svg',
      'dark': 'lib/assets/icons/dark.svg', 
      'steel': 'lib/assets/icons/steel.svg', 
      'fairy': 'lib/assets/icons/fairy.svg'
    };

    return icon[type] ?? 'lib/assets/icons/normal.svg';
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
            SvgPicture.asset(getIconByType(type.name), width: 20, height: 20,),
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