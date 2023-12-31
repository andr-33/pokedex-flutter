import 'package:flutter/material.dart';
import 'package:mobile_pokedex/domain/services/pokemon_services.dart';
import 'package:mobile_pokedex/presentation/provider/pokemon_provider.dart';
import 'package:mobile_pokedex/presentation/widgets/SmallCard/small_card.dart';
import 'package:provider/provider.dart';
import 'package:stroke_text/stroke_text.dart';

class AllPokemosScreen extends StatefulWidget {
  @override
  _AllPokemonsScreenState createState() => _AllPokemonsScreenState();
}

class _AllPokemonsScreenState extends State<AllPokemosScreen> {
  int _acctionIndex = 1;
  @override
  Widget build(BuildContext context) {
    final pokemonProvider = context.watch<PokemonProvider>();
    int offset = pokemonProvider.offset;

    void switchAction(int index) {
      setState(() {
        _acctionIndex = index;
      });

      switch (index) {
        case 0:
          pokemonProvider.previousPokemons();
          break;
        case 1:
          pokemonProvider.nextPokemons();
          break;
      }
    }

    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: getAllPokemons(offset),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> pokemonName = snapshot.data!;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 30,
                  backgroundColor: Colors.red[400],
                  flexibleSpace: FlexibleSpaceBar(
                      title: StrokeText(
                    text: 'Pokedex',
                    textStyle: TextStyle(
                        fontFamily: 'Pokemon',
                        color: Colors.amber[400],
                        fontSize: 34),
                    strokeColor: Colors.blue,
                    strokeWidth: 5,
                  )),
                ),
                SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return SmallCard(name: pokemonName[index]);
                    }),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4))
              ],
            );
          } else if(snapshot.hasError){}

          return const CircularProgressIndicator();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: switchAction,
        currentIndex: _acctionIndex,
        backgroundColor: Colors.red[400],
        unselectedItemColor: Colors.grey[600],
        selectedItemColor: Colors.white70,
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
