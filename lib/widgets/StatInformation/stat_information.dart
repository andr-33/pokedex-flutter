import 'package:flutter/material.dart';
import 'package:mobile_pokedex/models/pokemon_model.dart';
import 'package:string_capitalize/string_capitalize.dart';

class StatInformation extends StatelessWidget{

  StatInformation({
    super.key,
    required this.stat
  });

  final Stat stat;
  final Map<String, int> color ={
    'hp': 0xFFB6DB1D,
    'attack': 0xFFDB4E1D,
    'defense': 0xFF2A6BDB,
    'special Attack': 0xFFA656DC,
    'special Defense': 0xFFA656DC,
    'speed': 0xFFFFC107,
  };

  Color getColorByStat( String type){
    return Color(color[type] ?? 0xFFFFC107);
  }


  double statPercentageCalculator(int statValue){
    double unroundedResult = statValue/300;
    return double.parse(unroundedResult.toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(stat.name.capitalize(), 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ) ,
            ),
            Text(": ${stat.baseValue}",
              style: TextStyle(
                fontSize: 20
              ),
            )
          ],
        ),
        Container(
          width: 250,
          height: 12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(width: 2)
          ),
          child: LinearProgressIndicator(
            value: statPercentageCalculator(stat.baseValue),
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation(getColorByStat(stat.name)),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        )
      ],
    );
  }
}