import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prueba_tecnica/core/dependency_injection/locator.dart';

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
      home: Scaffold(
        body: Center(
          child: Text('Holi'),
        ),
      ),
    );
  }
}
