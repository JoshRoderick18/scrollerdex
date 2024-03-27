import 'dart:developer';

import 'package:scrollerdex/core/services/http_service.dart';
import 'package:scrollerdex/domain/models/pokemon_data_model.dart';
import 'package:scrollerdex/domain/models/pokemon_model.dart';
import 'package:scrollerdex/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImplementation implements PokemonRepository {
  final HttpService _httpService;

  PokemonRepositoryImplementation({required HttpService httpService})
      : _httpService = httpService;

  late Pokemon _pokemon;
  late List<Pokemon?> _pokemons;
  int page = 0;

  @override
  Pokemon? get pokemon => _pokemon;

  @override
  List<Pokemon?> get pokemons => _pokemons;

  @override
  Future<PokemonData> getPokemonData(String name) async {
    try {
      final response = await _httpService.dio.get('/$name');
      return PokemonData.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    throw Exception('Failed to get pokemon');
  }

  @override
  Future<List<Pokemon>> getPokemons() async {
    try {
      page += 1;
      final response = await _httpService.dio.get('?limit=20&offset=0');
      return (response.data['results'] as List)
          .map((pokemon) => Pokemon.fromJson(pokemon))
          .toList();
    } catch (e) {
      log(e.toString());
    }
    throw Exception('Failed to get pokemons');
  }
}
