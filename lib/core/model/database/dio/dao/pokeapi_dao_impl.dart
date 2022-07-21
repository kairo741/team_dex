import 'package:team_dex/core/model/filter/filter.dart';
import 'package:team_dex/core/model/service/converter_services/pokemon_dto_converter.dart';
import 'package:team_dex/core/model/service/converter_services/simple_pokemon_dto_converter.dart';

import '../../../../controller/utils/constants.dart';
import '../../../dto/pokemon_dto.dart';
import '../../../dto/simple_pokemon_dto.dart';
import '../dio_config.dart';
import '../interfaces/pokeapi_dao.dart';

class PokeapiDAOImpl implements PokeapiDAO {
  final pokemonConverter = PokemonDTOConverter();
  final simplePokemonConverter = SimplePokemonDTOConverter();

  @override
  Future<PokemonDTO> getPokemonByPokedexNumber(int number) async {
    String path = PATH_POKEMON;
    var dio = await DioConfig.builderConfig();
    var response = await dio.get('$path/$number');

    return pokemonConverter.fromJson(response.data);
  }

  @override
  Future<List<PokemonDTO>> listPokemonByFilter(Filter filter) async {
    String path = PATH_POKEMON;
    var dio = await DioConfig.builderConfig();
    List<PokemonDTO> pokemon = [];

    for (int i = 1; i < filter.limit!; i++) {
      var response = await dio.get('$path/$i?limit=${filter.limit}&offset=${filter.offset}');
      print("Pokemon #$i");

      pokemon.add(pokemonConverter.fromJson(response.data));
    }

    return pokemon;
  }

  @override
  Future<List<SimplePokemonDTO>> listAllPokemon(Filter filter) async {
    String path = PATH_POKEMON;
    var dio = await DioConfig.builderConfig();
    var response = await dio.get(path);

    var list = response.data['results']
        .map<SimplePokemonDTO>((obj) => simplePokemonConverter.fromJson(obj))
        .toList();

    return list;
  }

  @override
  Future<List<PokemonDTO>> listByNames(List<String> names) async {
    String path = PATH_POKEMON;
    var dio = await DioConfig.builderConfig();
    List<PokemonDTO> pokemon = [];

    for (var element in names) {
      var response = await dio.get('$path/$element');
      print("Pokemon $element");
      pokemon.add(pokemonConverter.fromJson(response.data));
    }

    return pokemon;
  }
}
