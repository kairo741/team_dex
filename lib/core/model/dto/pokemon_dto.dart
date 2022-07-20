import 'package:team_dex/core/model/dto/pokemon_sprites_dto.dart';
import 'package:team_dex/core/model/dto/pokemon_type_dto.dart';

class PokemonDTO {
  int pokedexNumber;
  String name;
  int? weight;
  int? height;
  List<PokemonTypeDTO> types;
  PokemonSpritesDTO sprites;

  PokemonDTO({
    required this.pokedexNumber,
    required this.name,
    this.weight,
    this.height,
    required this.types,
    required this.sprites,
  });
}
