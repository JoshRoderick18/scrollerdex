import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollerdex/presentation/controllers/scrollerdex_view_controller.dart';

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
    ref.read(scrollerdexViewProvider).getPokemonData('bulbasaur');
  }

  @override
  Widget build(BuildContext context) {
    final pokemonData = ref.watch(scrollerdexViewProvider).pokemonData;
    final isLoading = ref.watch(
      scrollerdexViewProvider.select((value) => value.isLoading),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: const Text("Pokedex"),
      ),
      body: Container(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Text(
                  pokemonData.toString(),
                ),
              ),
      ),
    );
  }
}
