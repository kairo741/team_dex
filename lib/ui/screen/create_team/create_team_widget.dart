import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:team_dex/core/model/dto/simple_pokemon_dto.dart';
import 'package:team_dex/ui/screen/shared_components/default_next_button.dart';

import '../../../core/controller/pokemon_controller.dart';
import '../../theme/colors.dart';
import 'create_team_page.dart';

class CreateTeamWidget extends State<CreateTeamPage> {
  final PokemonController _pokemonController = PokemonController();

  String? teamName;
  List<SimplePokemonDTO> teamList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: dexLightRedColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextFormField(
            decoration: const InputDecoration(hintText: "Nome do time"),
            onChanged: (value) {
              teamName = value;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownSearch<SimplePokemonDTO>.multiSelection(
            asyncItems: (text) async => _pokemonController.listAllPokemon(),
            itemAsString: (item) => toBeginningOfSentenceCase(item.name) ?? item.name,
            onChanged: (List<SimplePokemonDTO> list) {
              teamList = list;
            },
          ),
          const Spacer(),
          DefaultNextButton(
              buttonText: "Salvar",
              buttonColor: dexLightRedColor,
              onTap: () {
                _pokemonController.saveTeam(teamName, teamList, context);
              })
        ]),
      ),
    );
  }
}
