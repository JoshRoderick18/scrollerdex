import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollerdex/core/dependency_injection/locator.dart';
import 'package:scrollerdex/core/utils/get_color_by_type.dart';
import 'package:scrollerdex/domain/models/pokemon_data_model.dart';
import 'package:scrollerdex/domain/repositories/pokemon_repository.dart';

class ScrollerdexViewController extends ChangeNotifier {
  final PokemonRepository _pokemonRepository;

  bool isLoading = true;
  List<PokemonData?> _pokemonsData = [];
  List<PokemonData?> get pokemonsData => _pokemonsData;

  ScrollerdexViewController({required PokemonRepository pokemonRepository})
      : _pokemonRepository = pokemonRepository;

  Future<List<PokemonData?>> getPokemonsData() async {
    _pokemonsData = await _pokemonRepository.getPokemonsData();
    log('Pokemons data: $_pokemonsData');
    isLoading = false;
    notifyListeners();
    return _pokemonsData;
  }

  Color getColorFromPokemonType(String type) {
    return getColorByType(type);
  }
}

final scrollerdexViewProvider = ChangeNotifierProvider(
  (ref) => ScrollerdexViewController(
    pokemonRepository: locator<PokemonRepository>(),
  ),
);
