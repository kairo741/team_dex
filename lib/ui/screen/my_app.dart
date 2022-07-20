import 'package:flutter/material.dart';
import 'package:team_dex/ui/screen/pokedex/pokedex_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TeamDex',
      theme:
          ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light),
      home: const PokedexPage(),
    );
  }
}
