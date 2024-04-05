import 'package:flutter/material.dart';
import 'package:scrollerdex/domain/models/pokemon_data_model.dart';
import 'package:scrollerdex/presentation/views/favorites_view.dart';
import 'package:scrollerdex/presentation/widgets/pokemon_stats_card.dart';

class PokemonView extends StatelessWidget {
  final PokemonData pokemonData;
  final Color typeColor;
  final Function(PokemonData) onSavePokemon;

  const PokemonView(
      {super.key,
      required this.pokemonData,
      required this.typeColor,
      required this.onSavePokemon});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: typeColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 24),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _FavoritesPokemons(),
                  const Spacer(),
                  _PokemonHeader(
                      pokemonId: pokemonData.id, pokemonName: pokemonData.name),
                  PokemonStatsCard(
                      pokemonData: pokemonData,
                      typeColor: typeColor,
                      onSavePokemonTap: onSavePokemon),
                ],
              ),
              Positioned(
                bottom: 210,
                child: _PokemonImage(pokemonImageUrl: pokemonData.sprite),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FavoritesPokemons extends StatelessWidget {
  const _FavoritesPokemons();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const FavoritesView();
            },
          ),
        );
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'My favorites',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.favorite_border_outlined,
            size: 40,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class _PokemonHeader extends StatelessWidget {
  final String pokemonName;
  final int pokemonId;
  const _PokemonHeader({required this.pokemonName, required this.pokemonId});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pokemon No. $pokemonId',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        Text(
          '${pokemonName[0].toUpperCase()}${pokemonName.substring(1)}',
          style: const TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _PokemonImage extends StatelessWidget {
  final String pokemonImageUrl;
  const _PokemonImage({required this.pokemonImageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.42,
      child: Image.network(
        pokemonImageUrl,
      ),
    );
  }
}
