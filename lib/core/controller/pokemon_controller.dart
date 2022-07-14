import 'package:team_dex/core/model/dto/pokemon_dto.dart';

import 'dio_config.dart';
import 'utils/constants.dart';

class PokemonController {
  getPokemonByPokedexNumber(int number) async {
    String path = PATH_POKEMON;
    var dio = await DioConfig.builderConfig();
    var response = await dio.get('$path/2');

    return PokemonDTO.fromJson(response.data);
  }
}
