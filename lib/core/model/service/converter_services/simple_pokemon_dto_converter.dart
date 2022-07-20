import '../../dto/simple_pokemon_dto.dart';

class SimplePokemonDTOConverter {
  static const String NAME = "name";
  static const String URL = "url";

  SimplePokemonDTO fromJson(Map<String, dynamic> json) => SimplePokemonDTO(
        name: json[NAME] as String,
        url: json[URL] as String,
      );

  Map<String, dynamic> toJson(SimplePokemonDTO dto) {
    return {
      NAME: dto.name,
      URL: dto.url,
    };
  }
}
