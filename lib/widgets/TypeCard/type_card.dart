import 'package:flutter/material.dart';
import 'package:mobile_pokedex/models/pokemon_model.dart';

class TypeCard extends StatelessWidget{
  TypeCard({
    super.key,
    required this.type
  });

  final PokemonType type;

  int colorFromType(){
    return 3;
  }

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFA8A77A),
          width: 1.0
        ),
        color: Colors.amber,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Text(type.name.toUpperCase(), 
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontSize: 20
          ),
        ),
      ),
    );
  }
}