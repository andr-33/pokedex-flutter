import 'package:flutter/material.dart';
import 'package:mobile_pokedex/presentation/provider/pokemon_provider.dart';
import 'package:mobile_pokedex/presentation/screens/pokemon_screen.dart';
import 'package:mobile_pokedex/presentation/screens/all_pokemons_screen.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokemonProvider(),
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

//Home page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<PokemonProvider>();

    bool isPokemonSelected = appState.isPokemonSelected;

    Widget page = isPokemonSelected ? PokemonScreen() : AllPokemosScreen();

    return page;
  }
}
