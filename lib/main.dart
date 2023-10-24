import 'package:flutter/material.dart';
import 'package:mobile_pokedex/widgets/ImageSvg/image_svg.dart';
import 'package:mobile_pokedex/widgets/SmallCard/small_card.dart';
import 'package:mobile_pokedex/models/pokemon_model.dart';
import 'package:mobile_pokedex/widgets/StatText/stat_text.dart';
import 'package:mobile_pokedex/widgets/TypeCard/type_card.dart';
import 'package:provider/provider.dart';

//services
import './services/pokemon_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'My Pokedex',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: HomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  bool isPokemonSelected = false;
  String pokemonNameSelected = "";

  void selectedPokemon() {
    isPokemonSelected = true;
    notifyListeners();
  }

  void deselectPokemon() {
    isPokemonSelected = false;
    notifyListeners();
  }

  void selectedPokemonName(String pokemonName) {
    pokemonNameSelected = pokemonName;
    notifyListeners();
  }
}

//Home page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    bool isPokemonSelected = appState.isPokemonSelected;

    Widget page = isPokemonSelected ? PokemonPage() : AllPokemosPage();

    return page;
  }
}

//All pokemos page
class AllPokemosPage extends StatelessWidget {
  AllPokemosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<dynamic>>(
          future: getAllPokemons(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                crossAxisCount: 2,
                children: snapshot.data!
                    .map((pokemon) => SmallCard(pokemonCard: pokemon))
                    .toList(),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

//Pokemon page
class PokemonPage extends StatelessWidget {
  PokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pokemonName = appState.pokemonNameSelected;

    return Center(
      child: Column(
        children: [
          ElevatedButton.icon(
              onPressed: () {
                appState.deselectPokemon();
              },
              icon: Icon(Icons.arrow_back_rounded),
              label: Text("Exit")
          ),
          ImageSvg(width: 200, height: 200, name: pokemonName),
          SizedBox(height: 15),
          FutureBuilder<Pokemon>(
              future: getPokemonByName(pokemonName),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: snapshot.data!.types.map((type) => TypeCard(type: type)).toList()
                      ),
                      Column(children: snapshot.data!.stats.map((stat) => StatText(stat: stat)).toList()),
                    ],
                  );
                } else if (snapshot.hasError) {}

                return const CircularProgressIndicator();
              })
        ],
      ),
    );
  }
}
