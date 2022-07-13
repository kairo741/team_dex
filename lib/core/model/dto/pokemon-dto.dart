class PokemonDTO {
  static const String POKEDEX_NUMBER = "id";

  int pokedexNumber;

  PokemonDTO({
    required this.pokedexNumber,
  });

  static PokemonDTO fromJson(Map<String, dynamic> json) =>
      PokemonDTO(pokedexNumber: json[POKEDEX_NUMBER] as int);

  Map<String, dynamic> toJson() {
    return {
      POKEDEX_NUMBER: pokedexNumber,
    };
  }
}
