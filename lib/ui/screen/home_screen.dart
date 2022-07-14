import 'package:flutter/material.dart';
import 'package:team_dex/core/controller/pokemon_controller.dart';
import 'package:team_dex/core/model/dto/pokemon_dto.dart';
import 'package:team_dex/ui/screen/components/pokemon_square_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PokemonController _pokemonController = PokemonController();

  var _loading = true;
  PokemonDTO? pokemon;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      setState(() {
        _loading = true;
      });
      var pokemon = await _pokemonController.getPokemonByPokedexNumber(10);

      setState(() {
        _loading = false;
        this.pokemon = pokemon;
      });
    } catch (e) {
      debugPrint("Erro ao buscar pokémon");
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TeamDex'),
      ),
      body: Column(children: [
        if (!_loading) ...[
          PokemonSquareTile(pokemon: pokemon!)
        ] else ...[
          const Padding(
            padding: EdgeInsets.only(top: 50),
            child: Center(
              child: CircularProgressIndicator(color: Colors.red),
            ),
          )
        ]
      ]),
    );
  }
}
