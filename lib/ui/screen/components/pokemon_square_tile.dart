import 'package:flutter/material.dart';
import 'package:team_dex/core/controller/pokemon_controller.dart';

import '../../../core/controller/utils/constants.dart';
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
      child: Column(
        children: [
          Image.network(pokemon.sprites.frontDefault),
        ],
      ),
    );
  }
}
