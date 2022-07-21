
import '../../../entity/pokemon_team.dart';

abstract class TeamDAO {
  save(PokemonTeam pokemon);

  remove(int id);

  Future<List<PokemonTeam>> find(int idList);

  Future<List<PokemonTeam>> findAll();
}