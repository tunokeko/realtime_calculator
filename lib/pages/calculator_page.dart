import 'package:flutter/material.dart';
import 'package:realtime_calculator/components/calculator.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.lightGreen, Colors.cyanAccent],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight)),
        child: Padding(padding: const EdgeInsets.all(50), child: Calculator()),
      ),
    );
  }
}
