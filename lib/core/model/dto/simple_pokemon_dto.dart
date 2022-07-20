

class SimplePokemonDTO {
  static const String NAME = "name";
  static const String URL = "url";

  String name;
  String url;

  SimplePokemonDTO({
    required this.name,
    required this.url,
  });

  static SimplePokemonDTO fromJson(Map<String, dynamic> json) =>
      SimplePokemonDTO(
        name: json[NAME] as String,
        url: json[URL] as String,
      );

  Map<String, dynamic> toJson() {
    return {
      NAME: name,
      URL: url,
    };
  }
}
