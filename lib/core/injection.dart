import 'package:get_it/get_it.dart';
import 'package:team_dex/core/model/sqflite/dao/team_dao_impl.dart';
import 'package:team_dex/core/model/sqflite/interfaces/team_dao.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<TeamDAO>(TeamDAOImpl());
}
