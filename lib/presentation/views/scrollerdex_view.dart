import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollerdex/presentation/controllers/scrollerdex_view_controller.dart';
import 'package:scrollerdex/presentation/views/pokemon_view.dart';

class ScrollerdexView extends StatefulHookConsumerWidget {
  const ScrollerdexView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ScrollerdexViewState();
}

class _ScrollerdexViewState extends ConsumerState<ScrollerdexView> {
  @override
  void initState() {
    super.initState();
    ref.read(scrollerdexViewProvider).getPokemonsData();
  }

  @override
  Widget build(BuildContext context) {
    final pokemonData = ref.watch(scrollerdexViewProvider).pokemonsData;
    final isLoading = ref.watch(
      scrollerdexViewProvider.select((value) => value.isLoading),
    );
    return Container(
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: pokemonData.length,
              itemBuilder: (context, index) {
                return PokemonView(
                  onSavePokemon: ref.read(scrollerdexViewProvider).savePokemon,
                  pokemonData: pokemonData[index]!,
                  typeColor: ref
                      .read(scrollerdexViewProvider)
                      .getColorFromPokemonType(
                          pokemonData[index]!.types[0].typeName),
                );
              },
            ),
    );
  }
}
