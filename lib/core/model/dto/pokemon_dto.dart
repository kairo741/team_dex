import 'package:team_dex/core/model/dto/pokemon_sprites_dto.dart';
import 'package:team_dex/core/model/dto/pokemon_type_dto.dart';

class PokemonDTO {
  static const String POKEDEX_NUMBER = "id";
  static const String NAME = "name";
  static const String WHEIGHT = "weight";
  static const String HEIGHT = "height";
  static const String TYPES = "types";
  static const String SPRITES = "sprites";

  int pokedexNumber;
  String name;
  int? weight;
  int? height;
  List<PokemonTypeDTO> types;
  PokemonSpritesDTO sprites;

  PokemonDTO({
    required this.pokedexNumber,
    required this.name,
    this.weight,
    this.height,
    required this.types,
    required this.sprites,
  });

  static PokemonDTO fromJson(Map<String, dynamic> json) => PokemonDTO(
        pokedexNumber: json[POKEDEX_NUMBER] as int,
        name: json[NAME] as String,
        weight: json[WHEIGHT] as int?,
        height: json[HEIGHT] as int?,
        types: json[TYPES] != null
            ? (json[TYPES].map<PokemonTypeDTO>((e) => PokemonTypeDTO.fromJson(e))).toList()
            : [],
        sprites: PokemonSpritesDTO.fromJson(json[SPRITES]) ,
      );

  Map<String, dynamic> toJson() {
    return {
      POKEDEX_NUMBER: pokedexNumber,
      NAME: name,
      WHEIGHT: weight,
      HEIGHT: height,
      TYPES: types.map((i) => i.toString()).toList(),
      SPRITES: sprites,
    };
  }
}
