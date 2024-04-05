import 'dart:convert';
import 'dart:developer';

import 'package:scrollerdex/core/services/http_service.dart';
import 'package:scrollerdex/core/services/shared_preferences_service.dart';
import 'package:scrollerdex/domain/models/pokemon_data_model.dart';
import 'package:scrollerdex/domain/models/pokemon_model.dart';
import 'package:scrollerdex/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImplementation implements PokemonRepository {
  final HttpService _httpService;
  final SharedPreferencesService _sharedPreferencesService;

  PokemonRepositoryImplementation(
      {required HttpService httpService,
      required SharedPreferencesService sharedPreferencesService})
      : _httpService = httpService,
        _sharedPreferencesService = sharedPreferencesService {
    _pokemonsData = [];
  }

  late List<PokemonData?> _pokemonsData;
  late List<PokemonData?> _savedPokemons;

  @override
  List<PokemonData?> get pokemonsData => _pokemonsData;

  @override
  List<PokemonData?> get savedPokemons => _savedPokemons;

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

  @override
  Future<List<PokemonData>> getSavedPokemons() async {
    final savedPokemonsString =
        await _sharedPreferencesService.getSavedPokemons();
    final savedPokemonsJson = savedPokemonsString.map((e) => jsonDecode(e));
    return savedPokemonsJson.map((e) => PokemonData.fromLocalJson(e)).toList();
  }

  @override
  void removePokemon(int index) async {
    final savedPokemons = await _sharedPreferencesService.getSavedPokemons();
    savedPokemons.removeAt(index);
    await _sharedPreferencesService.setSavedPokemons(savedPokemons);
  }

  @override
  void savePokemon(PokemonData pokemon) async {
    final pokemonJson = pokemon.toJson();
    final pokemonString = jsonEncode(pokemonJson);
    final savedPokemons = await _sharedPreferencesService.getSavedPokemons();
    log(name: 'savedPokemons', savedPokemons.toString());
    savedPokemons.add(pokemonString);
    await _sharedPreferencesService.setSavedPokemons(savedPokemons);
  }
}
