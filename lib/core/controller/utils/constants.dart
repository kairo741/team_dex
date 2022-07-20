const String POKE_API_IP = "https://pokeapi.co/api/v2";
const String PATH_POKEMON = "/pokemon";


const String CREATE_TABLE_POKE_TEAM = """
CREATE TABLE poke_team(
id INTEGER PRIMARY KEY AUTOINCREMENT
, team_name VARCHAR (255) NOT NULL
, names VARCHAR (255) NOT NULL
, create_date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
, status CHAR(1) NOT NULL DEFAULT 'A'
);
""";