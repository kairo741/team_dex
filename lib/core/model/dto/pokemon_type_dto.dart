class PokemonTypeDTO {
  static const String TYPE = "type";
  static const String NAME = "name";
  static const String URL = "url";

  String name;
  String url;

  PokemonTypeDTO({
    required this.name,
    required this.url,
  });

  static PokemonTypeDTO fromJson(Map<String, dynamic> json) =>
      PokemonTypeDTO(name: json[TYPE][NAME] as String,url: json[TYPE][URL]);

  Map<String, dynamic> toJson() {
    return {
      NAME: name,
      URL: url,
    };
  }
}
