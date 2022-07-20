import 'package:get_it/get_it.dart';
import 'package:team_dex/core/model/database/dio/interfaces/pokeapi_dao.dart';
import 'package:team_dex/core/model/database/dio/services/pokeapi_service.dart';
import 'package:team_dex/core/model/database/sqflite/services/pokemon_team_service.dart';

import 'model/database/dio/dao/pokeapi_dao_impl.dart';
import 'model/database/sqflite/dao/team_dao_impl.dart';
import 'model/database/sqflite/interfaces/team_dao.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<TeamDAO>(TeamDAOImpl());
  getIt.registerSingleton<PokemonTeamService>(PokemonTeamService());

  getIt.registerSingleton<PokeapiDAO>(PokeapiDAOImpl());
  getIt.registerSingleton<PokeapiService>(PokeapiService());
}
