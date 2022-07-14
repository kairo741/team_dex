class PokemonSpritesDTO {
  static const String FRONT_DEFAUT = "front_default";
  static const String FRONT_SHINY = "front_shiny";
  static const String OFFICIAL_ARTWORK = "official-artwork";
  static const String OTHER = "other";

  String frontDefault;
  String frontShinyDefault;
  String? artworkFrontDefault;

  PokemonSpritesDTO({
    required this.frontDefault,
    required this.frontShinyDefault,
    required this.artworkFrontDefault,
  });

  static PokemonSpritesDTO fromJson(Map<String, dynamic> json) =>
      PokemonSpritesDTO(
          frontDefault: json[FRONT_DEFAUT],
          frontShinyDefault: json[FRONT_SHINY],
          artworkFrontDefault: json[OTHER]?[OFFICIAL_ARTWORK]?[FRONT_DEFAUT]);

  Map<String, dynamic> toJson() {
    return {FRONT_DEFAUT: frontDefault, FRONT_SHINY: frontShinyDefault};
  }
}
