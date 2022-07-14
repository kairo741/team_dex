import 'package:team_dex/core/model/dto/pokemon_dto.dart';
import 'package:team_dex/core/model/service/pokemon_service.dart';

class PokemonController {
  final PokemonService _service = PokemonService();

  Future<PokemonDTO> getPokemonByPokedexNumber(int number) async {
    var pokemon = await _service.getPokemonByPokedexNumber(number);

    return pokemon;
  }
}
