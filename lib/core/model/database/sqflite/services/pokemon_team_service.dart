import 'package:get_it/get_it.dart';
import 'package:team_dex/core/model/entity/pokemon_team.dart';

import '../interfaces/team_dao.dart';

class PokemonTeamService {
  final _dao = GetIt.I.get<TeamDAO>();

  save(PokemonTeam team) async {
    validate(team);
    await _dao.save(team);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<PokemonTeam>> find(int idList) {
    return _dao.find(idList);
  }

  validate(PokemonTeam team) {
    if (team.teamName == null) {
      throw Exception("O nome é obrigatório!");
    }
  }
}
