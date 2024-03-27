import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollerdex/core/dependency_injection/locator.dart';
import 'package:scrollerdex/domain/models/pokemon_data_model.dart';
import 'package:scrollerdex/domain/models/pokemon_model.dart';
import 'package:scrollerdex/domain/repositories/pokemon_repository.dart';

class ScrollerdexViewController extends ChangeNotifier {
  final PokemonRepository _pokemonRepository;

  List<Pokemon> _pokemons = [];
  List<Pokemon> get pokemons => _pokemons;
  bool isLoading = true;
  PokemonData? _pokemonData;
  PokemonData? get pokemonData => _pokemonData;

  ScrollerdexViewController({required PokemonRepository pokemonRepository})
      : _pokemonRepository = pokemonRepository;

  Future<void> getPokemons() async {
    _pokemons = await _pokemonRepository.getPokemons();
    isLoading = false;
    notifyListeners();
  }

  Future<PokemonData?> getPokemonData(String name) async {
    _pokemonData = await _pokemonRepository.getPokemonData(name);
    isLoading = false;
    notifyListeners();
    return _pokemonData;
  }
}

final scrollerdexViewProvider = ChangeNotifierProvider(
  (ref) => ScrollerdexViewController(
    pokemonRepository: locator<PokemonRepository>(),
  ),
);
