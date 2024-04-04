import 'package:flutter/material.dart';
import 'package:scrollerdex/domain/models/pokemon_data_model.dart';

class PokemonStatsCard extends StatelessWidget {
  final PokemonData pokemonData;
  final Color typeColor;

  const PokemonStatsCard(
      {super.key, required this.pokemonData, required this.typeColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 350,
        ),
        Container(
          height: 240,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _PokemonStatsContainer(
                      color: typeColor,
                      stat: pokemonData.stats[1].statName,
                      value: pokemonData.stats[1].baseStat,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    _PokemonStatsContainer(
                      color: typeColor,
                      stat: pokemonData.stats[2].statName,
                      value: pokemonData.stats[2].baseStat,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _PokemonStatsContainer(
                      color: typeColor,
                      stat: pokemonData.stats[0].statName.toUpperCase(),
                      value: pokemonData.stats[0].baseStat,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    _TypeContainer(
                      type: pokemonData.types[0].typeName,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.77,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black87),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        child: const Text(
                          'I choose you!',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PokemonStatsContainer extends StatelessWidget {
  final String stat;
  final int value;
  final Color color;
  const _PokemonStatsContainer({
    required this.stat,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.22,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Center(
                child: Text(
                  '${stat[0].toUpperCase()}${stat.substring(1)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Center(
                child: Text(
                  value.toString(),
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TypeContainer extends StatelessWidget {
  const _TypeContainer({required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    String capitalizedType = '${type[0].toUpperCase()}${type.substring(1)}';
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(6),
      ),
      width: MediaQuery.of(context).size.width * 0.37,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Center(
          child: Text(
            'Type: $capitalizedType',
            style: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
