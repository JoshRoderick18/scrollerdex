import 'package:scrollerdex/domain/models/pokemon_data_model.dart';
import 'package:scrollerdex/domain/models/pokemon_model.dart';

abstract class PokemonRepository {
  Pokemon? get pokemon;
  List<Pokemon?> get pokemons;
  Future<PokemonData> getPokemonData(String name);
  Future<List<Pokemon>> getPokemons();
}
