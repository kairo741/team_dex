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
      default:
        return TYPE_COLOR_GRASS;
    }
  }
}
