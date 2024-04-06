import 'package:flutter/material.dart';
import 'package:scrollerdex/domain/models/pokemon_data_model.dart';

class FavoritesList extends StatelessWidget {
  const FavoritesList({
    super.key,
    required this.savedPokemons,
    required this.getColorbyType,
    required this.onDeletePokemon,
  });

  final List<PokemonData?> savedPokemons;
  final Function(String) getColorbyType;
  final Function(int) onDeletePokemon;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: savedPokemons.length,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: getColorbyType(savedPokemons[index]!.types[0].typeName),
          ),
          margin: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 5),
                child: Image.network(
                  savedPokemons[index]!.sprite,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  '${savedPokemons[index]!.name[0].toUpperCase()}${savedPokemons[index]!.name.substring(1)}',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(12),
                child: IconButton(
                  icon: const Icon(Icons.delete_outlined,
                      color: Colors.white, size: 30),
                  onPressed: () {
                    onDeletePokemon(index);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
