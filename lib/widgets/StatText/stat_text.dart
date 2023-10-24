import 'package:flutter/material.dart';
import 'package:mobile_pokedex/models/pokemon_model.dart';

class StatText extends StatelessWidget{
  StatText({
    super.key,
    required this.stat
  });

  final Stat stat;

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Text(stat.name, 
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            decoration: TextDecoration.none
          ) ,
        ),
        SizedBox(width: 10,),
        Text("${stat.baseValue}",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 20,
            decoration: TextDecoration.none
          ),
        )
      ],
    );
  }
}