import '../../controller/utils/constants.dart';
import '../dto/pokemon_dto.dart';
import 'dio_config.dart';

class PokemonService{

  Future<PokemonDTO> getPokemonByPokedexNumber(int number) async {
    String path = PATH_POKEMON;
    var dio = await DioConfig.builderConfig();
    var response = await dio.get('$path/$number');

    return PokemonDTO.fromJson(response.data);
  }

}