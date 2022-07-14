class PokemonSpritesDTO {
  static const String FRONT_DEFAUT = "front_default";
  static const String FRONT_SHINY_DEFAULT = "front_shiny_default";

  String frontDefault;
  String frontShinyDefault;

  PokemonSpritesDTO({
    required this.frontDefault,
    required this.frontShinyDefault,
  });

  static PokemonSpritesDTO fromJson(Map<String, dynamic> json) =>
  PokemonSpritesDTO(frontDefault: json[FRONT_DEFAUT], frontShinyDefault: json[FRONT_SHINY_DEFAULT]);

  Map<String, dynamic> toJson() {
    return {
      FRONT_DEFAUT: frontDefault,
      FRONT_SHINY_DEFAULT: frontShinyDefault
    };
  }
}
