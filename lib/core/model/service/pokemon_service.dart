import 'package:get_it/get_it.dart';
import 'package:team_dex/core/model/database/dio/services/pokeapi_service.dart';
import 'package:team_dex/core/model/filter/filter.dart';

import '../dto/pokemon_dto.dart';
import '../dto/simple_pokemon_dto.dart';

class PokemonService {
  final _service = GetIt.I.get<PokeapiService>();

  Future<PokemonDTO> getPokemonByPokedexNumber(int dexNumber) async {
    return _service.getByDexNumber(dexNumber);
  }

  Future<List<PokemonDTO>> listPokemonByFilter(Filter? filter) async {
    return _service.listByFilter(filter ?? Filter());
  }

  Future<List<SimplePokemonDTO>> listAllPokemon(Filter? filter) async {
    return _service.listAll(filter ?? Filter());
  }
}
