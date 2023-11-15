import 'package:flutter/material.dart';
import 'package:mobile_pokedex/domain/services/pokemon_services.dart';
import 'package:mobile_pokedex/main.dart';
import 'package:mobile_pokedex/presentation/widgets/SmallCard/small_card.dart';
import 'package:provider/provider.dart';

class AllPokemosScreen extends StatelessWidget {
  AllPokemosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myPokemonAppState = context.watch<MyAppState>();
    print(myPokemonAppState.offset);
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<dynamic>>(
        future: getAllPokemons(myPokemonAppState.offset, myPokemonAppState.limit),
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
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value){
          myPokemonAppState.increment();
          print(myPokemonAppState.offset);
        },
        backgroundColor: Colors.transparent, 
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_circle_left_outlined),
            label: 'Previous',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_circle_right_outlined),
            label: 'Next',
          ),
        ],
      ),
    );
  }
}