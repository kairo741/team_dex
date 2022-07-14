import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:team_dex/core/controller/pokemon_controller.dart';

import '../../../core/model/dto/pokemon_dto.dart';

class PokemonSquareTile extends StatelessWidget {
  final PokemonDTO pokemon;

  PokemonSquareTile({Key? key, required this.pokemon}) : super(key: key);

  final PokemonController _controller = PokemonController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _controller.getColorByPokemonType(pokemon.types[0])),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 5),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              toBeginningOfSentenceCase(pokemon.name).toString(),
              style:
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Container(
              alignment: Alignment.bottomRight,
              width: 200,
              child: Image.network(pokemon.sprites.frontDefault),
            ),
          ],
        ),
      ),
    );
  }
}
