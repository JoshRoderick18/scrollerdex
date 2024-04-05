import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollerdex/domain/models/pokemon_data_model.dart';
import 'package:scrollerdex/presentation/controllers/favorites_view_controller.dart';

class FavoritesView extends StatefulHookConsumerWidget {
  final List<PokemonData?> savedPokemons;

  const FavoritesView(this.savedPokemons, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 50,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.4, top: 20),
            child: const Text(
              'My Favorites',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(screenWidth * 0.06),
          child: ListView.builder(
            itemCount: widget.savedPokemons.length,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ref
                      .read(favoritesViewProvider)
                      .getColorFromPokemonType(
                          widget.savedPokemons[index]!.types[0].typeName),
                ),
                margin: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, bottom: 5),
                      child: Image.network(
                        widget.savedPokemons[index]!.sprite,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        '${widget.savedPokemons[index]!.name[0].toUpperCase()}${widget.savedPokemons[index]!.name.substring(1)}',
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
                          // Handle delete action
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
