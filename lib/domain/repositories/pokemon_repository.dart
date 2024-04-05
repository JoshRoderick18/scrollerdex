import 'package:scrollerdex/domain/models/pokemon_data_model.dart';

abstract class PokemonRepository {
  List<PokemonData?> get pokemonsData;
  Future<List<PokemonData>> getPokemonsData();
  List<PokemonData?> get savedPokemons;
}
