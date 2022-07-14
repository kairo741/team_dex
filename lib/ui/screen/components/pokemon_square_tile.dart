import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:team_dex/core/controller/pokemon_controller.dart';
import 'package:team_dex/ui/theme/app_text_styles.dart';

import '../../../core/model/dto/pokemon_dto.dart';
import 'pokemon_type_tile.dart';

class PokemonSquareTile extends StatelessWidget {
  final PokemonDTO pokemon;

  PokemonSquareTile({Key? key, required this.pokemon}) : super(key: key);

  final PokemonController _controller = PokemonController();
  final NumberFormat formatter = NumberFormat('000');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.only(top: 8, left: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _controller.getColorByPokemonType(pokemon.types[0])),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: const EdgeInsets.only(right: 10),
              alignment: Alignment.bottomRight,
              child: Text(
                '#${formatter.format(pokemon.pokedexNumber)}',
                style: AppTextStyles.pokedexNumber,
              )),
          Text(
            toBeginningOfSentenceCase(pokemon.name).toString(),
            style: AppTextStyles.pokemonName,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: pokemon.types.length,
                  itemBuilder: (context, index) =>
                      PokemonTypeTile(typeDTO: pokemon.types[index]),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 4,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Image.network(
                    (pokemon.sprites.artworkFrontDefault ??
                        pokemon.sprites.frontDefault),
                    fit: BoxFit.fitHeight,
                    // loadingBuilder: (context, child, loadingProgress) =>
                    //     const CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
