import 'dart:ui';

import 'package:team_dex/core/model/dto/pokemon_dto.dart';
import 'package:team_dex/core/model/service/pokemon_service.dart';

import '../../ui/theme/colors.dart';
import '../model/dto/pokemon_type_dto.dart';
import '../model/dto/simple_pokemon_dto.dart';
import '../model/filter/filter.dart';

class PokemonController {
  final PokemonService _service = PokemonService();

  Future<PokemonDTO> getPokemonByPokedexNumber(int number) async {
    var pokemon = await _service.getPokemonByPokedexNumber(number);

    return pokemon;
  }

  Future<List<PokemonDTO>> listPokemonByFilter({Filter? filter}) async {
    var pokemon = await _service.listPokemonByFilter(filter ?? Filter());

    return pokemon;
  }

  Future<List<SimplePokemonDTO>> listAllPokemon({Filter? filter}) async {
    var pokemon = await _service.listAllPokemon(filter ?? Filter());

    return pokemon;
  }

  Color getColorByPokemonType(PokemonTypeDTO type) {
    switch (type.name.toLowerCase()) {
      case 'normal':
        return typeColorNormal;
      case 'grass':
        return typeColorGrass;
      case 'fire':
        return typeColorFire;
      case 'water':
        return typeColorWater;
      case 'electric':
        return typeColorElectric;
      case 'ice':
        return typeColorIce;
      case 'fighting':
        return typeColorFighting;
      case 'poison':
        return typeColorPoison;
      case 'ground':
        return typeColorGround;
      case 'flying':
        return typeColorFlying;
      case 'psychic':
        return typeColorPsychic;
      case 'bug':
        return typeColorBug;
      case 'rock':
        return typeColorRock;
      case 'ghost':
        return typeColorGhost;
      case 'dragon':
        return typeColorDragon;
      case 'dark':
        return typeColorDark;
      case 'steel':
        return typeColorSteel;
      case 'fairy':
        return typeColorFairy;

      default:
        return typeColorUnknown;
    }
  }
}
