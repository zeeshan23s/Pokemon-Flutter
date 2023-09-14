import 'dart:convert';

import '../exports.dart';

class PokemonController {
  static final List<Pokemon> favorite = [];

  static SharedPreferences? prefs;

  static Future<void> getFavoritePokemon() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs != null) {
      final favoriteList = prefs!.getString('MyFavorite');
      if (favoriteList != null) {
        final favoritePokemons = json.decode(favoriteList);
        favorite.addAll(favoritePokemons);
      }
    }
  }

  static Future<void> addFavoritePokemon(Pokemon pokemon) async {
    if (prefs != null) {
      favorite.add(pokemon);
      await prefs!.setString('MyFavorite', json.encode(favorite));
    }
  }

  static Future<void> removeFavoritePokemon(Pokemon pokemon) async {
    if (prefs != null) {
      favorite.remove(pokemon);
      await prefs!.setString('MyFavorite', json.encode(favorite));
    }
  }
}
