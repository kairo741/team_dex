import 'package:team_dex/core/model/dto/pokemon_type_dto.dart';

class PokemonDTO {
  static const String POKEDEX_NUMBER = "id";
  static const String NAME = "name";
  static const String WHEIGHT = "weight";
  static const String HEIGHT = "height";
  static const String TYPES = "types";

  int pokedexNumber;
  String name;
  double? weight;
  double? height;
  List<PokemonTypeDTO> types;

  PokemonDTO({
    required this.pokedexNumber,
    required this.name,
    this.weight,
    this.height,
    required this.types,
  });

  static PokemonDTO fromJson(Map<String, dynamic> json) => PokemonDTO(
        pokedexNumber: json[POKEDEX_NUMBER] as int,
        name: json[NAME] as String,
        weight: json[WHEIGHT] as double?,
        height: json[HEIGHT] as double?,
        types: json[TYPES] != null
            ? (json[TYPES].map<PokemonTypeDTO>((e) => PokemonTypeDTO.fromJson(e))).toList()
            : [],
      );

  Map<String, dynamic> toJson() {
    return {
      POKEDEX_NUMBER: pokedexNumber,
      NAME: name,
      WHEIGHT: weight,
      HEIGHT: height,
      TYPES: types.map((i) => i.toString()).toList()
    };
  }
}
