import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollerdex/core/dependency_injection/locator.dart';
import 'package:scrollerdex/core/utils/get_color_by_type.dart';
import 'package:scrollerdex/domain/models/pokemon_data_model.dart';
import 'package:scrollerdex/domain/repositories/pokemon_repository.dart';

class FavoritesViewController extends ChangeNotifier {
  final PokemonRepository _pokemonRepository;

  FavoritesViewController({required PokemonRepository pokemonRepository})
      : _pokemonRepository = pokemonRepository;

  List<PokemonData?> _savedPokemons = [];
  List<PokemonData?> get savedPokemons => _savedPokemons;

  Future<List<PokemonData?>> getSavedPokemonsData() async {
    _savedPokemons = await _pokemonRepository.getSavedPokemons();
    notifyListeners();
    return _savedPokemons;
  }

  void removeSavedPokemon(int index) {
    _pokemonRepository.removePokemon(index);
    _savedPokemons.removeAt(index);
    notifyListeners();
  }

  Color getColorFromPokemonType(String type) {
    return getColorByType(type);
  }
}

final favoritesViewProvider = ChangeNotifierProvider(
  (ref) => FavoritesViewController(
    pokemonRepository: locator<PokemonRepository>(),
  ),
);
