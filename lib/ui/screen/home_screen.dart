import 'package:flutter/material.dart';
import 'package:team_dex/core/controller/pokemon_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokemonController pokemonController = PokemonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TeamDex'),
      ),
      body: Column(children: [
        FloatingActionButton(onPressed: () {
          pokemonController.getPokemonByPokedexNumber(10);
        })
      ]),
    );
  }
}
