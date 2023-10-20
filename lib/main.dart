import 'package:flutter/material.dart';
import 'package:mobile_pokedex/elements/ImageSvg/image_svg.dart';
import 'package:mobile_pokedex/elements/SmallCard/small_card.dart';
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

  void selectedPokemon(){
    isPokemonSelected = true;
    notifyListeners();
  }
}

//Home page
class HomePage extends StatelessWidget{
 
  @override
  Widget build(BuildContext context){
    var appState = context.watch<MyAppState>();
    bool isPokemonSelected = appState.isPokemonSelected;

    Widget page = isPokemonSelected ? PokemonPage(): AllPokemosPage();

    return page;
  }
}

//All pokemos page
class AllPokemosPage extends StatelessWidget{
  AllPokemosPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<dynamic>>(
          future: getAllPokemons(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return GridView.count(
                crossAxisCount: 2,
                children: snapshot.data!.map((pokemon) => SmallCard(pokemonCard: pokemon)).toList(),
              );
            }
            else if(snapshot.hasError){
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
class PokemonPage extends StatelessWidget{
  PokemonPage({super.key});

  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: [
          ImageSvg(width: 80, height: 80, name: "bulbasaur")
        ],
      ),
    );
  }
}



