import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollerdex/core/dependency_injection/locator.dart';
import 'package:scrollerdex/presentation/views/scrollerdex_view.dart';
import 'package:scrollerdex/presentation/views/pokemon_view.dart';

void main() {
  runApp(
    const ProviderScope(child: MainApp()),
  );
  setupLocator();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PokemonView(),
    );
  }
}
