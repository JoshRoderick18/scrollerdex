import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollerdex/presentation/controllers/scrollerdex_view_controller.dart';
import 'package:scrollerdex/presentation/widgets/pokemon_card.dart';

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
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: pokemonData.length,
                  itemBuilder: (context, index) {
                    return Scaffold(
                        backgroundColor: ref
                            .read(scrollerdexViewProvider)
                            .getColorFromPokemonType(
                                pokemonData[index]!.types[0].typeName),
                        body: Stack(
                          children: [
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.1,
                              child: Padding(
                                padding: const EdgeInsets.all(50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Pokemon No. ${pokemonData[index]!.id}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '${pokemonData[index]!.name[0].toUpperCase()}${pokemonData[index]!.name.substring(1)}',
                                      style: const TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: PokemonCard(
                                          pokemonData: pokemonData[index]!),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ));
                  },
                ),
        ),
      ),
    );
  }
}
