import 'package:flutter/material.dart';
import 'package:team_dex/core/controller/pokemon_controller.dart';
import 'package:team_dex/core/model/dto/pokemon_dto.dart';

import '../../theme/colors.dart';
import '../create_team/create_team_page.dart';
import '../shared_components/pokemon_square_tile.dart';
import '../shared_components/team_drawer.dart';
import 'pokedex_page.dart';

class PokedexWidget extends State<PokedexPage> {
  final PokemonController _pokemonController = PokemonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: FutureBuilder(
          future: _pokemonController.listPokemonByFilter(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var list = snapshot.data as List<PokemonDTO>;
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 1,
                childAspectRatio: 4.0,
                children: List.generate(
                  list.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: TeamDrawer(
                        pokemon: list[index],
                      ),
                    );
                  },
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: dexLightRedColor,
        title: const Text(
          'TeamDex',
          style: TextStyle(color: Colors.white70, fontFamily: 'Pokemon'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const CreateTeamPage();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _pokemonController.listPokemonByFilter(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var list = snapshot.data as List<PokemonDTO>;
            return GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 1.25,
              children: List.generate(
                list.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: PokemonSquareTile(pokemon: list[index]),
                  );
                },
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
