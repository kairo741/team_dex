import '../../dto/pokemon_type_dto.dart';

class PokemonTypeDTOConverter {
  static const String TYPE = "type";
  static const String NAME = "name";
  static const String URL = "url";

  PokemonTypeDTO fromJson(Map<String, dynamic> json) =>
      PokemonTypeDTO(name: json[TYPE][NAME] as String, url: json[TYPE][URL]);

  Map<String, dynamic> toJson(PokemonTypeDTO dto) {
    return {
      NAME: dto.name,
      URL: dto.url,
    };
  }
}
