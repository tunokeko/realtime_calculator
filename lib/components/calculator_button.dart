import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;

  const CalculatorButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.7),
          border: Border.all(color: Colors.white)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
