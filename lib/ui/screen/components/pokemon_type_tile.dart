import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:team_dex/core/model/dto/pokemon_type_dto.dart';
import 'package:team_dex/ui/theme/app_text_styles.dart';

class PokemonTypeTile extends StatelessWidget {
  final PokemonTypeDTO typeDTO;

  const PokemonTypeTile({Key? key, required this.typeDTO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2, bottom: 2, left: 6, right: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white30),
      child: Text(
        toBeginningOfSentenceCase(typeDTO.name).toString(),
        style: AppTextStyles.pokemonType,
      ),
    );
  }
}
