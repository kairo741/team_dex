import 'package:flutter/material.dart';
import 'package:team_dex/core/model/entity/pokemon_team.dart';
import 'package:team_dex/ui/theme/app_text_styles.dart';

class TeamTile extends StatelessWidget {
  final PokemonTeam team;

  const TeamTile({Key? key, required this.team}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              team.teamName!,
              style: AppTextStyles.pokemonName,
            ),
          ),
        ),
      ),
    );
  }
}
