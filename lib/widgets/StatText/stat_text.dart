import 'package:flutter/material.dart';
import 'package:mobile_pokedex/models/pokemon_model.dart';
import 'package:string_capitalize/string_capitalize.dart';

class StatText extends StatelessWidget{
  StatText({
    super.key,
    required this.stat
  });

  final Stat stat;

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Text(stat.name.capitalize(), 
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            decoration: TextDecoration.none
          ) ,
        ),
        Container(
          width: 300,
          height: 10,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(width: 2)
          ),
          child: LinearProgressIndicator(
            value: 0.75,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation(Colors.amber),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        )
      ],
    );
  }
}