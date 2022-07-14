import 'dart:ui';

import 'package:team_dex/core/controller/utils/constants.dart';
import 'package:team_dex/core/model/dto/pokemon_dto.dart';
import 'package:team_dex/core/model/service/pokemon_service.dart';

import '../model/dto/pokemon_type_dto.dart';

class PokemonController {
  final PokemonService _service = PokemonService();

  Future<PokemonDTO> getPokemonByPokedexNumber(int number) async {
    var pokemon = await _service.getPokemonByPokedexNumber(number);

    return pokemon;
  }

  Color getColorByPokemonType(PokemonTypeDTO type) {
    switch (type.name.toLowerCase()) {
      case 'normal':
        return TYPE_COLOR_NORMAL;
      case 'grass':
        return TYPE_COLOR_GRASS;
      case 'fire':
        return TYPE_COLOR_FIRE;
      case 'water':
        return TYPE_COLOR_WATER;
      case 'electric':
        return TYPE_COLOR_ELECTRIC;
      case 'ice':
        return TYPE_COLOR_ICE;
      case 'fighting':
        return TYPE_COLOR_FIGHTING;
      case 'poison':
        return TYPE_COLOR_POISON;
      case 'ground':
        return TYPE_COLOR_GROUND;
      case 'flying':
        return TYPE_COLOR_FLYING;
      case 'psychic':
        return TYPE_COLOR_PSYCHIC;
      case 'bug':
        return TYPE_COLOR_BUG;
      case 'rock':
        return TYPE_COLOR_ROCK;
      case 'ghost':
        return TYPE_COLOR_GHOST;
      case 'dragon':
        return TYPE_COLOR_DRAGON;
      case 'dark':
        return TYPE_COLOR_DARK;
      case 'steel':
        return TYPE_COLOR_STEEL;
      case 'fairy':
        return TYPE_COLOR_FAIRY;

      default:
        return TYPE_COLOR_UNKNOWN;
    }
  }
}
