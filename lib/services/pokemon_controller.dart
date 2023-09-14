import 'dart:convert';

import '../exports.dart';

class PokemonController with ChangeNotifier {
  List<Pokemon> _favorite = [];

  List<Pokemon> get favorite => _favorite;

  SharedPreferences? prefs;

  Future<void> getFavoritePokemon(String uid) async {
    prefs = await SharedPreferences.getInstance();
    _favorite = [];
    if (prefs != null) {
      final favoriteList = prefs!.getString(uid);
      if (favoriteList != null) {
        final favoritePokemons = json.decode(favoriteList);
        for (dynamic pokemon in favoritePokemons) {
          _favorite.add(Pokemon.fromJson(pokemon));
        }
      }
    }

    notifyListeners();
  }

  Future<void> addFavoritePokemon(Pokemon pokemon, String uid) async {
    if (prefs != null) {
      _favorite.add(pokemon);
      await prefs!.setString(uid, json.encode(_favorite));
    }

    notifyListeners();
  }

  Future<void> removeFavoritePokemon(Pokemon pokemon, String uid) async {
    if (prefs != null) {
      _favorite.remove(pokemon);
      await prefs!.setString(uid, json.encode(_favorite));
    }

    notifyListeners();
  }
}
