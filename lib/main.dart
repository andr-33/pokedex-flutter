import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:mobile_pokedex/elements/SmallCard/small_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
//models
import './models/pokemon_model.dart';
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
  
}

//Home page

class HomePage extends StatelessWidget{
  const HomePage({super.key});

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
class PokemonPage extends StatefulWidget{
  const PokemonPage({super.key});

  @override
  State<PokemonPage> createState()=> _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage>{
  late Future<Pokemon> futurePokemon;

  @override
  void initState(){
    super.initState();
    futurePokemon = getPokemon();
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: Center(
        child: FutureBuilder<Pokemon>(
          future: futurePokemon,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return PokemonView(pokemon: snapshot.data!);
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

class PokemonView extends StatelessWidget{
  const PokemonView({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.network(pokemon.imgURL, width: 250, height: 250,),
        Text(pokemon.name),
        for(var stat in pokemon.stats)
          Text('${stat.name}: ${stat.baseValue}'),
        for(var type in pokemon.types)
          Text('${type.name}')
      ],
    );
  }

}


