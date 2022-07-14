import 'package:flutter/material.dart';

import '../../../core/model/dto/pokemon_dto.dart';

class PokemonSquareTile extends StatelessWidget {
  final PokemonDTO pokemon;

  const PokemonSquareTile({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Image.network(pokemon.sprites.frontDefault),
    );
  }
}
