class PokemonTypeDTO {
  static const String NAME = "name";
  static const String URL = "url";

  String name;
  String url;

  PokemonTypeDTO({
    required this.name,
    required this.url,
  });

  static PokemonTypeDTO fromJson(Map<String, dynamic> json) =>
      PokemonTypeDTO(name: json[NAME] as String,url: json[URL]);

  Map<String, dynamic> toJson() {
    return {
      NAME: name,
      URL: url,
    };
  }
}
