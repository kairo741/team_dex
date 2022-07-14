import 'package:flutter/material.dart';

import '../../../core/model/dto/pokemon_dto.dart';

class PokemonSquareTile extends StatelessWidget {
  final PokemonDTO pokemon;

  const PokemonSquareTile({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("aaa"),
    );
  }
}
