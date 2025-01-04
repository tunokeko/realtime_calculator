import 'package:realtime_calculator/calculator_state.dart';

enum ButtonType { allclear, delete, decimal, equals, number, operator }

class ButtonModel {
  final ButtonType type;
  final String text;
  final int span;

  ButtonModel({required this.type, required this.text, required this.span});

  CalculatorState get calculator => CalculatorState();

  void onPressed() {
    // each button type has a different task
    switch (type) {
      case ButtonType.decimal || ButtonType.number:
        calculator.type(text);
        break;
      case ButtonType.operator:
        calculator.modifyOperator(text);
      case ButtonType.allclear:
        calculator.clear();
      case ButtonType.delete:
        calculator.delete();
      case ButtonType.equals:
        calculator.equals();
    }
  }
}

final List<ButtonModel> buttons = [
  ButtonModel(type: ButtonType.allclear, text: "AC", span: 2),
  ButtonModel(type: ButtonType.delete, text: "DEL", span: 1),
  ButtonModel(type: ButtonType.operator, text: "+", span: 1),
  ButtonModel(type: ButtonType.number, text: "1", span: 1),
  ButtonModel(type: ButtonType.number, text: "2", span: 1),
  ButtonModel(type: ButtonType.number, text: "3", span: 1),
  ButtonModel(type: ButtonType.operator, text: "-", span: 1),
  ButtonModel(type: ButtonType.number, text: "4", span: 1),
  ButtonModel(type: ButtonType.number, text: "5", span: 1),
  ButtonModel(type: ButtonType.number, text: "6", span: 1),
  ButtonModel(type: ButtonType.operator, text: "*", span: 1),
  ButtonModel(type: ButtonType.number, text: "7", span: 1),
  ButtonModel(type: ButtonType.number, text: "8", span: 1),
  ButtonModel(type: ButtonType.number, text: "9", span: 1),
  ButtonModel(type: ButtonType.operator, text: "/", span: 1),
  ButtonModel(type: ButtonType.decimal, text: ".", span: 1),
  ButtonModel(type: ButtonType.number, text: "0", span: 1),
  ButtonModel(type: ButtonType.equals, text: "=", span: 2),
];
