import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollerdex/domain/models/pokemon_data_model.dart';
import 'package:scrollerdex/presentation/controllers/favorites_view_controller.dart';
import 'package:scrollerdex/presentation/widgets/favorites_list.dart';

class FavoritesView extends StatefulHookConsumerWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {
  @override
  void initState() {
    super.initState();
    ref.read(favoritesViewProvider).getSavedPokemonsData();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    List<PokemonData?> savedPokemons =
        ref.watch(favoritesViewProvider).savedPokemons;
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
          child: FavoritesList(
            savedPokemons: savedPokemons,
            getColorbyType:
                ref.read(favoritesViewProvider).getColorFromPokemonType,
            onDeletePokemon: ref.read(favoritesViewProvider).removeSavedPokemon,
          ),
        ),
      ),
    );
  }
}
