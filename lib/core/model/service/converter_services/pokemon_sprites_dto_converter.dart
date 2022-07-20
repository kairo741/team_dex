import '../../dto/pokemon_sprites_dto.dart';

class PokemonSpritesDTOConverter {
  static const String FRONT_DEFAUT = "front_default";
  static const String FRONT_SHINY = "front_shiny";
  static const String OFFICIAL_ARTWORK = "official-artwork";
  static const String OTHER = "other";

  PokemonSpritesDTO fromJson(Map<String, dynamic> json) => PokemonSpritesDTO(
      frontDefault: json[FRONT_DEFAUT],
      frontShinyDefault: json[FRONT_SHINY],
      artworkFrontDefault: json[OTHER]?[OFFICIAL_ARTWORK]?[FRONT_DEFAUT]);

  Map<String, dynamic> toJson(PokemonSpritesDTO dto) {
    return {FRONT_DEFAUT: dto.frontDefault, FRONT_SHINY: dto.frontShinyDefault};
  }
}
