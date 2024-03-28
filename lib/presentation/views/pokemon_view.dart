import 'package:flutter/material.dart';

class PokemonView extends StatelessWidget {
  const PokemonView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 42, horizontal: 24),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FavoritesPokemons(),
                  PokemonHeader(),
                  PokemonStatsCard(),
                ],
              ),
              Positioned(
                bottom: 200,
                child: PokemonImage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoritesPokemons extends StatelessWidget {
  const FavoritesPokemons({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Mis favoritos',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.favorite,
            size: 40,
          ),
        ],
      ),
    );
  }
}

class PokemonHeader extends StatelessWidget {
  const PokemonHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pokemon No. 1',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Pitoco',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class PokemonImage extends StatelessWidget {
  const PokemonImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Image.network(
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png',
      ),
    );
  }
}

class PokemonStatsCard extends StatelessWidget {
  const PokemonStatsCard({super.key});

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
            padding: const EdgeInsets.all(24.0),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PokemonStatsContainer(
                        color: Colors.orange,
                        stat: 'Attack',
                        value: 100,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      PokemonStatsContainer(
                        color: Colors.orange,
                        stat: 'Attack',
                        value: 100,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PokemonStatsContainer(
                        color: Colors.orange,
                        stat: 'Attack',
                        value: 100,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TypeContainer(
                        type: 'Fire',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Hola',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
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
        ),
      ],
    );
  }
}

class PokemonStatsContainer extends StatelessWidget {
  const PokemonStatsContainer({
    super.key,
    required this.stat,
    required this.value,
    required this.color,
  });

  final String stat;
  final int value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text(stat),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              value.toString(),
            ),
          ),
        ),
      ],
    );
  }
}

class TypeContainer extends StatelessWidget {
  const TypeContainer({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 40,
      width: 120,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Type: $type'),
      ),
    );
  }
}
