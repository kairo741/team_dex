import 'package:team_dex/core/model/filter/filter.dart';

import '../../controller/utils/constants.dart';
import '../dto/pokemon_dto.dart';
import '../dto/simple_pokemon_dto.dart';
import 'dio_config.dart';

class PokemonService {
  Future<PokemonDTO> getPokemonByPokedexNumber(int number) async {
    String path = PATH_POKEMON;
    var dio = await DioConfig.builderConfig();
    var response = await dio.get('$path/$number');

    return PokemonDTO.fromJson(response.data);
  }

  Future<List<PokemonDTO>> listPokemonByFilter(Filter filter) async {
    String path = PATH_POKEMON;
    var dio = await DioConfig.builderConfig();
    List<PokemonDTO> pokemon = [];

    for (int i = 1; i < filter.limit!; i++) {
      var response = await dio
          .get('$path/$i?limit=${filter.limit}&offset=${filter.offset}');
      print("Pokemon #$i");
      pokemon.add(PokemonDTO.fromJson(response.data));
    }

    return pokemon;
  }

  Future<List<SimplePokemonDTO>> listAllPokemon(Filter filter) async {
    String path = PATH_POKEMON;
    var dio = await DioConfig.builderConfig();
    var response = await dio.get(path);

    var list = response.data['results']
        .map<SimplePokemonDTO>((obj) => SimplePokemonDTO.fromJson(obj))
        .toList();

    return list;
  }
}
