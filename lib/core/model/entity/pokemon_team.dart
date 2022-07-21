class PokemonTeam {
  static const String ID = 'id';
  static const String TEAM_NAME = 'team_name';
  static const String NAMES = 'names';
  static const String STATUS = 'status';
  static const String CREATE_DATE = 'create_date';

  int? id;
  String? teamName;
  String? names;
  String status;
  DateTime? createDate;

  PokemonTeam({this.id, this.teamName, this.names, required this.status, this.createDate});
}
