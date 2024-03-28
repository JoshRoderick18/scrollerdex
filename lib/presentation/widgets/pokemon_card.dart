import 'package:flutter/material.dart';
import 'package:scrollerdex/domain/models/pokemon_data_model.dart';

class PokemonCard extends StatelessWidget {
  final PokemonData pokemonData;

  const PokemonCard({super.key, required this.pokemonData});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Image.network(pokemonData.sprite),
        ),
        Positioned(
          bottom: 30,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Attack"),
                      // const SizedBox(width: 30),
                      Text(pokemonData.stats[1].baseStat.toString()),
                      // SizedBox(width: MediaQuery.of(context).size.width * 0.3),
                      const Text("Defense"),
                      // const SizedBox(width: 30),
                      Text(pokemonData.stats[2].baseStat.toString()),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("HP"),
                      const SizedBox(width: 30),
                      Text(pokemonData.stats[0].baseStat.toString()),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.3),
                      const Text("Defense"),
                      const SizedBox(width: 30),
                      Text(pokemonData.stats[2].baseStat.toString()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
