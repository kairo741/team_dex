import 'package:team_dex/core/model/dto/pokemon_type_dto.dart';

class PokemonDTO {
  static const String POKEDEX_NUMBER = "id";
  static const String TYPES = "types";

  int pokedexNumber;
  List<PokemonTypeDTO> types;

  PokemonDTO({
    required this.pokedexNumber,
    required this.types,
  });

  static PokemonDTO fromJson(Map<String, dynamic> json) => PokemonDTO(
        pokedexNumber: json[POKEDEX_NUMBER] as int,
        types: json[TYPES] != null
            ? (json[TYPES].map<PokemonTypeDTO>((e) => PokemonTypeDTO.fromJson(e))).toList()
            : [],
      );

  Map<String, dynamic> toJson() {
    return {
      POKEDEX_NUMBER: pokedexNumber,
    };
  }
}
