import 'dart:convert';

import '../exports.dart';
import 'package:http/http.dart' as http;

class PokemonController {
  static Future<void> getPokemonList() async {
    final Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/');
    var response = await http.get(url);
    Map<String, dynamic> pokemonListData = jsonDecode(response.body);
    for (Map<String, dynamic> pokemon in pokemonListData['results']) {
      debugPrint(pokemon.toString());
    }
  }
}
