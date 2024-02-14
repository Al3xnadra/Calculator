import 'package:flutter/material.dart';
import 'package:flutter_calculator/calculator/pages/calculator_page.dart';
import 'package:flutter_calculator/data/injection_containter/injection_containter.dart';

void main() {
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorPage(),
    );
  }
}
