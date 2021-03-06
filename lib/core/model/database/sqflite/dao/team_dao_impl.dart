import 'package:sqflite/sqflite.dart';
import '../../../entity/pokemon_team.dart';
import '../connection.dart';
import '../interfaces/team_dao.dart';

class TeamDAOImpl implements TeamDAO {
  Database? _db;
  var sql;

  @override
  Future<List<PokemonTeam>> find(int idTeam) async {
    _db = await Connection.get();
    List<Map<String, dynamic>> result = await _db!.query('poke_team', where: "id = $idTeam");
    List<PokemonTeam> resultList = List.generate(result.length, (index) {
      var row = result[index];
      return PokemonTeam(
        id: row[PokemonTeam.ID],
        teamName: row[PokemonTeam.TEAM_NAME],
        names: row[PokemonTeam.NAMES],
        status: row[PokemonTeam.STATUS],
        createDate: DateTime.parse(row[PokemonTeam.CREATE_DATE]),
      );
    });
    return resultList;
  }

  @override
  Future<List<PokemonTeam>> findAll() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> result = await _db!.query('poke_team', limit: 100);
    print(result);
    List<PokemonTeam> resultList = List.generate(result.length, (index) {
      var row = result[index];
      return PokemonTeam(
        id: row[PokemonTeam.ID],
        teamName: row[PokemonTeam.TEAM_NAME],
        names: (row[PokemonTeam.NAMES]),
        status: row[PokemonTeam.STATUS],
        createDate: DateTime.parse(row[PokemonTeam.CREATE_DATE]),
      );
    });
    return resultList;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    sql = "DELETE FROM poke_team WHERE id =? ";
    _db!.rawDelete(sql, [id]);
  }

  @override
  save(PokemonTeam pokemon) async {
    _db = await Connection.get();
    if (pokemon.id == null) {
      sql = """INSERT INTO poke_team (team_name, names) VALUES(?,?) """;
      _db!.rawInsert(sql, [pokemon.teamName, pokemon.names]);
    } else {
      sql = "UPDATE poke_team SET team_name=?, names=? WHERE id=?";
      await _db!.rawUpdate(sql, [pokemon.teamName, pokemon.names, pokemon.id]);
    }
  }
}
