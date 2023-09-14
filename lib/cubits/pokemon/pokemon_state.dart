part of 'pokemon_cubit.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final String? next;
  final String? previous;
  final int pageIndex;
  final List<Pokemon> pokemon;

  PokemonLoaded(this.next, this.previous, this.pageIndex, this.pokemon);
}

class PokemonError extends PokemonState {
  final String error;
  PokemonError(this.error);
}
