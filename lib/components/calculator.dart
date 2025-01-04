import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:realtime_calculator/calculator_state.dart';
import 'package:realtime_calculator/components/calculator_button.dart';
import 'package:realtime_calculator/models/button_model.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final CalculatorState _calculatorState = CalculatorState();

  @override
  void initState() {
    super.initState();
    _calculatorState.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            flex: 1,
            child: Container(
              color: Colors.black,
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _calculatorState.backgroundText,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.7),
                          fontSize: 16),
                    ),
                    Text(_calculatorState.foregroundString,
                        style: TextStyle(color: Colors.white, fontSize: 28))
                  ],
                ),
              ),
            )),
        Flexible(
            flex: 4,
            child: StaggeredGrid.count(
              crossAxisCount: 4,
              children: List.generate(buttons.length, (index) {
                return StaggeredGridTile.count(
                    crossAxisCellCount: buttons[index].span,
                    mainAxisCellCount: 1,
                    child: CalculatorButton(
                      text: buttons[index]
                          .text, // i want to seperate logic from design
                      onPressed: buttons[index].onPressed,
                    ));
              }),
            ))
      ],
    );
  }
}
