import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:team_dex/core/model/database/dio/services/pokeapi_service.dart';
import 'package:team_dex/core/model/database/sqflite/services/pokemon_team_service.dart';
import 'package:team_dex/core/model/entity/pokemon_team.dart';
import 'package:team_dex/core/model/filter/filter.dart';

import '../dto/pokemon_dto.dart';
import '../dto/simple_pokemon_dto.dart';

class PokemonService {
  final _pokeapiService = GetIt.I.get<PokeapiService>();
  final _pokeTeamService = GetIt.I.get<PokemonTeamService>();

  Future<PokemonDTO> getPokemonByPokedexNumber(int dexNumber) async {
    return _pokeapiService.getByDexNumber(dexNumber);
  }

  Future<List<PokemonDTO>> listPokemonByFilter(Filter? filter) async {
    return _pokeapiService.listByFilter(filter ?? Filter());
  }

  Future<List<SimplePokemonDTO>> listAllPokemon(Filter? filter) async {
    return _pokeapiService.listAll(filter ?? Filter());
  }

  saveTeam(String? teamName, List<SimplePokemonDTO>? teamList, BuildContext context) async {
    if (teamList == null) {
      throw Exception("O time é obrigatório");
    }
    if (teamName == null) {
      throw Exception("O nome do time é obrigatório");
    }

    var names = teamList.map((e) => e.name.toLowerCase()).join(',');

    var team = PokemonTeam(teamName: teamName, names: names, status: "A");

    _pokeTeamService.save(team).then((_) => Navigator.of(context).pop());
  }
}
