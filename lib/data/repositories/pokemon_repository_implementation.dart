import 'dart:developer';

import 'package:scrollerdex/core/services/http_service.dart';
import 'package:scrollerdex/domain/models/pokemon_data_model.dart';
import 'package:scrollerdex/domain/models/pokemon_model.dart';
import 'package:scrollerdex/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImplementation implements PokemonRepository {
  final HttpService _httpService;

  PokemonRepositoryImplementation({required HttpService httpService})
      : _httpService = httpService;

  late List<PokemonData?> _pokemonsData;

  @override
  List<PokemonData?> get pokemonsData => _pokemonsData;

  Future<List<Pokemon>> _getPokemons() async {
    try {
      final response = await _httpService.dio.get('?limit=20&offset=0');
      return (response.data['results'] as List)
          .map((pokemon) => Pokemon.fromJson(pokemon))
          .toList();
    } catch (e) {
      log(e.toString());
    }
    throw Exception('Failed to get pokemons');
  }

  Future<PokemonData> _getPokemonData(String name) async {
    try {
      final response = await _httpService.dio.get('/$name');
      return PokemonData.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    throw Exception('Failed to get pokemon');
  }

  @override
  Future<List<PokemonData>> getPokemonsData() async {
    try {
      List<Pokemon> pokemons = await _getPokemons();
      List<PokemonData> pokemonDataList = [];

      for (Pokemon pokemon in pokemons) {
        PokemonData pokemonData = await _getPokemonData(pokemon.name);
        pokemonDataList.add(pokemonData);
      }

      return pokemonDataList;
    } catch (e) {
      log(e.toString());
    }

    throw Exception('Failed to get pokemon data for all pokemons');
  }
}
