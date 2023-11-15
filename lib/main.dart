import 'package:flutter/material.dart';
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
//hacer una carpeta que se llame provider
//copiar esta clase
  int _offset = 0;
  int _limit = 20;

  int get offset => _offset;
  int get limit => _offset;


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

  void increment(){
    _offset = _offset += 20;
    _limit = _limit += 20;
    notifyListeners();
  }

  void decrement(){
    _offset = _offset -= 20;
    _limit = _limit += 20;
    notifyListeners();
  }
}

//Home page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    bool isPokemonSelected = appState.isPokemonSelected;

    Widget page = isPokemonSelected ? PokemonScreen() : AllPokemosScreen();

    return page;
  }
}

//All pokemos page


//Pokemon page
