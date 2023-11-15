import 'package:flutter/material.dart';
import 'package:mobile_pokedex/domain/collections/color_by_type.dart';
import 'package:mobile_pokedex/domain/models/pokemon_model.dart';
import 'package:mobile_pokedex/domain/services/pokemon_services.dart';
import 'package:mobile_pokedex/main.dart';
import 'package:mobile_pokedex/presentation/widgets/PokemonImageSvg/pokemon_image_svg.dart';
import 'package:mobile_pokedex/presentation/widgets/SecondaryCard/secondary_card.dart';
import 'package:provider/provider.dart';

class PokemonScreen extends StatelessWidget {
  PokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pokemonName = appState.pokemonNameSelected;
    ColorByType colorByType = ColorByType();

    return FutureBuilder<Pokemon>(
        future: getPokemonByName(pokemonName),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    appState.deselectPokemon();
                  },
                ),
                backgroundColor: colorByType
                    .getColorByType(snapshot.data!.types[0].name)
                    .withOpacity(0.8),
              ),
              body: Container(
                  decoration: BoxDecoration(
                      color: colorByType
                          .getColorByType(snapshot.data!.types[0].name)
                          .withOpacity(0.8)),
                  child: Column(children: [
                    PokemonImageSvg(width: 200, height: 200, name: pokemonName),
                    SizedBox(height: 10),
                    SecondaryCard(
                      name: snapshot.data!.name,
                      stats: snapshot.data!.stats,
                      types: snapshot.data!.types,
                      weight: snapshot.data!.weight,
                      height: snapshot.data!.height,
                    )
                  ])),
            );
          } else if (snapshot.hasError) {}

          return const CircularProgressIndicator();
        });
  }
}
