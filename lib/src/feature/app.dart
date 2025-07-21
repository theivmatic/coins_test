import 'package:coin_cap_test/src/feature/coins/presentation/view/coins.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CoinsView());
  }
}
