import 'package:flutter/material.dart';

class PokemonProvider extends ChangeNotifier{

  bool isPokemonSelected = false;
  String pokemonNameSelected = "";
  int offset = 0;

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

  void nextPokemons(){
    offset += 20;
    notifyListeners();
  }

  void previousPokemons(){
    if(offset > 0){
      offset -= 20;
      notifyListeners();
    }
  }
}