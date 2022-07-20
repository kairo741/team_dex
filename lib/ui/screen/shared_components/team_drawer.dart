
import 'package:flutter/material.dart';
import 'package:team_dex/core/model/dto/pokemon_dto.dart';
import 'package:team_dex/ui/theme/app_text_styles.dart';

class TeamDrawer extends StatelessWidget {
  const TeamDrawer({Key? key, required PokemonDTO pokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              'Time 1',
              style: AppTextStyles.pokemonName,
            ),
          ),
        ),
      ),
    );
  }
}
