import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollerdex/core/dependency_injection/locator.dart';
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
    isLoading = false;
    notifyListeners();
    return _pokemonsData;
  }

  Color getColorFromPokemonType(String type) {
    switch (type) {
      case 'normal':
        return const Color(0xFFA8A77A);
      case 'fire':
        return const Color(0xFFEE8130);
      case 'water':
        return const Color(0xFF6390F0);
      case 'electric':
        return const Color(0xFFF7D02C);
      case 'grass':
        return const Color(0xFF7AC74C);
      case 'ice':
        return const Color(0xFF96D9D6);
      case 'fighting':
        return const Color(0xFFC22E28);
      case 'poison':
        return const Color(0xFFA33EA1);
      case 'ground':
        return const Color(0xFFE2BF65);
      case 'flying':
        return const Color(0xFFA98FF3);
      case 'psychic':
        return const Color(0xFFF95587);
      case 'bug':
        return const Color(0xFFA6B91A);
      case 'rock':
        return const Color(0xFFB6A136);
      case 'ghost':
        return const Color(0xFF735797);
      case 'dragon':
        return const Color(0xFF6F35FC);
      case 'dark':
        return const Color(0xFF705746);
      case 'steel':
        return const Color(0xFFB7B7CE);
      case 'fairy':
        return const Color(0xFFD685AD);
      default:
        return Colors.grey;
    }
  }
}

final scrollerdexViewProvider = ChangeNotifierProvider(
  (ref) => ScrollerdexViewController(
    pokemonRepository: locator<PokemonRepository>(),
  ),
);
