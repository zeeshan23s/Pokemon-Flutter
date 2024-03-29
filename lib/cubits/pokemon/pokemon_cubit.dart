import '../../exports.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonInitial()) {
    getPokemonList('https://pokeapi.co/api/v2/pokemon/');
  }

  Future<void> getPokemonList(String url) async {
    emit(PokemonLoading());
    final List<Pokemon> pokemons = [];

    try {
      final response = await http.get(Uri.parse(url));
      Map<String, dynamic> pokemonListData = jsonDecode(response.body);
      for (Map<String, dynamic> pokemon in pokemonListData['results']) {
        final response2 = await http.get(Uri.parse(pokemon['url']));
        Map<String, dynamic> pokemonData = jsonDecode(response2.body);
        pokemons.add(Pokemon(
            name: pokemon['name'],
            url: pokemon['url'],
            height: pokemonData['height'].toString(),
            width: pokemonData['weight'].toString()));
      }

      emit(PokemonLoaded(
          pokemonListData['next'], pokemonListData['previous'], pokemons));
    } catch (e) {
      emit(PokemonError(e.toString()));
    }
  }
}
