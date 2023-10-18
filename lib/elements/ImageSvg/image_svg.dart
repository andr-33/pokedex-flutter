import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_pokedex/services/pokemon_service.dart';

class ImageSvg extends StatelessWidget{
  ImageSvg({
    super.key,
    required this.width,
    required this.height,
    required this.name
  });

  final double width, height;
  final String name;

  @override
  Widget build(BuildContext context){
    return FutureBuilder<String>(
      future: getPokemonImage(name), 
      builder: (context, snapshot){
        if(snapshot.hasData){
          return SvgPicture.network(snapshot.data!, width: width, height: height,);
        }
        else if(snapshot.hasError){
          return Text('${snapshot.error}'); 
        }

        return const CircularProgressIndicator();
      }
    );
  }
}