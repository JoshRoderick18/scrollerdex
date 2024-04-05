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

  final List<PokemonData?> _savedPokemons = [];
  List<PokemonData?> get savedPokemons => _savedPokemons;

  // List<PokemonData?> getSavedPokemonsData() {
  //   _savedPokemons = _pokemonRepository.pokemonsData;
  //   return _savedPokemons;
  // }

  Color getColorFromPokemonType(String type) {
    return getColorByType(type);
  }
}

final favoritesViewProvider = ChangeNotifierProvider(
  (ref) => FavoritesViewController(
    pokemonRepository: locator<PokemonRepository>(),
  ),
);
