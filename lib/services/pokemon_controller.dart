import 'dart:convert';

import '../exports.dart';

class PokemonController with ChangeNotifier {
  final List<Pokemon> _favorite = [];

  List<Pokemon> get favorite => _favorite;

  SharedPreferences? prefs;

  Future<void> getFavoritePokemon() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs != null) {
      final favoriteList = prefs!.getString('MyFavorite');
      if (favoriteList != null) {
        final favoritePokemons = json.decode(favoriteList);
        for (dynamic pokemon in favoritePokemons) {
          _favorite.add(Pokemon.fromJson(pokemon));
        }
      }
    }

    notifyListeners();
  }

  Future<void> addFavoritePokemon(Pokemon pokemon) async {
    if (prefs != null) {
      _favorite.add(pokemon);
      await prefs!.setString('MyFavorite', json.encode(_favorite));
    }

    notifyListeners();
  }

  Future<void> removeFavoritePokemon(Pokemon pokemon) async {
    if (prefs != null) {
      _favorite.remove(pokemon);
      await prefs!.setString('MyFavorite', json.encode(_favorite));
    }

    notifyListeners();
  }
}
