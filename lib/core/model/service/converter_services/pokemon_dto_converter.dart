import 'package:team_dex/core/model/service/converter_services/pokemon_sprites_dto_converter.dart';
import 'package:team_dex/core/model/service/converter_services/pokemon_type_dto_converter.dart';

import '../../dto/pokemon_dto.dart';
import '../../dto/pokemon_type_dto.dart';

class PokemonDTOConverter {
  static const String POKEDEX_NUMBER = "id";
  static const String NAME = "name";
  static const String WHEIGHT = "weight";
  static const String HEIGHT = "height";
  static const String TYPES = "types";
  static const String SPRITES = "sprites";

  final spritesConverter = PokemonSpritesDTOConverter();
  final typeConverter = PokemonTypeDTOConverter();

  PokemonDTO fromJson(Map<String, dynamic> json) => PokemonDTO(
        pokedexNumber: json[POKEDEX_NUMBER] as int,
        name: json[NAME] as String,
        weight: json[WHEIGHT] as int?,
        height: json[HEIGHT] as int?,
        types: json[TYPES] != null
            ? (json[TYPES]
                .map<PokemonTypeDTO>((e) => typeConverter.fromJson(e))).toList()
            : [],
        sprites: spritesConverter.fromJson(json[SPRITES]),
      );

  Map<String, dynamic> toJson(PokemonDTO dto) {
    return {
      POKEDEX_NUMBER: dto.pokedexNumber,
      NAME: dto.name,
      WHEIGHT: dto.weight,
      HEIGHT: dto.height,
      TYPES: dto.types.map((i) => i.toString()).toList(),
      SPRITES: dto.sprites,
    };
  }
}
