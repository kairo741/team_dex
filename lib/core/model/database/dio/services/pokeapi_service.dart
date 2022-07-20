import 'package:get_it/get_it.dart';
import 'package:team_dex/core/model/database/dio/interfaces/pokeapi_dao.dart';

import '../../../dto/pokemon_dto.dart';
import '../../../dto/simple_pokemon_dto.dart';
import '../../../filter/filter.dart';

class PokeapiService {
  final _dao = GetIt.I.get<PokeapiDAO>();

  Future<List<SimplePokemonDTO>> listAll(Filter filter) async {
    return await _dao.listAllPokemon(filter);
  }

  Future<PokemonDTO> getByDexNumber(int dexNumber) async {
    return await _dao.getPokemonByPokedexNumber(dexNumber);
  }

  Future<List<PokemonDTO>> listByFilter(Filter filter) async {
    return _dao.listPokemonByFilter(filter);
  }
}
