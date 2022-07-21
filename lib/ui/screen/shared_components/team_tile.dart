import 'package:flutter/material.dart';
import 'package:team_dex/core/model/entity/pokemon_team.dart';
import 'package:team_dex/ui/theme/app_text_styles.dart';
import 'dart:math' as math;

class TeamTile extends StatelessWidget {
  final PokemonTeam team;
  final Function(PokemonTeam) onTap;

  const TeamTile({Key? key, required this.team, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          onTap(team);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Transform.rotate(
                      angle: 180 * math.pi / 180,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.catching_pokemon,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    team.teamName!,
                    style: AppTextStyles.pokemonName,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
