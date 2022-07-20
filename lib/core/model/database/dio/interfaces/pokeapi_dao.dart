

import '../../../dto/pokemon_dto.dart';
import '../../../dto/simple_pokemon_dto.dart';
import '../../../filter/filter.dart';

abstract class PokeapiDAO {
  Future<PokemonDTO> getPokemonByPokedexNumber(int number);

  Future<List<PokemonDTO>> listPokemonByFilter(Filter filter);

  Future<List<SimplePokemonDTO>> listAllPokemon(Filter filter);
}