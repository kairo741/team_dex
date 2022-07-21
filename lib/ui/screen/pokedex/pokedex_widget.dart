import 'package:flutter/material.dart';
import 'package:team_dex/core/controller/pokemon_controller.dart';
import 'package:team_dex/core/model/dto/pokemon_dto.dart';
import 'package:team_dex/core/model/entity/pokemon_team.dart';

import '../../theme/colors.dart';
import '../create_team/create_team_page.dart';
import '../shared_components/pokemon_square_tile.dart';
import '../shared_components/team_tile.dart';
import 'pokedex_page.dart';

class PokedexWidget extends State<PokedexPage> {
  final PokemonController _pokemonController = PokemonController();

  var _loading = false;
  PokemonTeam? currentTeam;
  List<PokemonTeam> teams = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      setState(() {
        _loading = true;
      });
      teams = (await _pokemonController.listAllTeams());

      setState(() {
        _loading = false;
        if (teams.isNotEmpty) {
          currentTeam = teams.first;
        }
      });
    } catch (e) {
      debugPrint("Erro ao buscar time");
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white70,
        child: ListView.builder(
          itemCount: teams.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(11.0),
              child: TeamTile(
                team: teams[index],
                onTap: (team) {
                  setState(() {
                    currentTeam = team;
                    Navigator.pop(context);
                  });
                },
              ),
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
                ).then((value) => getData());
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
        future: teams.isEmpty
            ? _pokemonController.listPokemonByFilter()
            : _pokemonController.listTeamPokemon(currentTeam!.names!),
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
