import 'package:flutter/foundation.dart';

class CalculatorState extends ChangeNotifier {
  double? backgroundValue;
  String foregroundString;
  String? operator;

  static final CalculatorState _instance = CalculatorState._internal(
      backgroundValue: null, foregroundString: "", operator: null);

  CalculatorState._internal(
      {required this.backgroundValue,
      required this.foregroundString,
      required this.operator});

  factory CalculatorState() => _instance;

  String _makeReadable(double? value) {
    if (value == null) {
      return "";
    }

    bool isInteger = value.toInt() == value;
    return isInteger
        ? value.toInt().toString()
        : value.toDouble().toStringAsFixed(2);
  }

  double? _compute() {
    return switch (operator) {
      "+" => backgroundValue! + foregroundValue!,
      "-" => backgroundValue! - foregroundValue!,
      "*" => backgroundValue! * foregroundValue!,
      "/" => backgroundValue! / foregroundValue!,
      _ => null
    };
  }

  String get backgroundText {
    return "${_makeReadable(backgroundValue)} ${operator ?? ""}";
  }

  double? get foregroundValue {
    return double.tryParse(foregroundString);
  }

  void type(String text) {
    if (foregroundString.contains(".") && text == ".") {
      return;
    }
    if (foregroundString == "" && text == ".") {
      return;
    }

    foregroundString += text;
    notifyListeners();
  }

  void modifyOperator(String newOperator) {
    if (operator == null && foregroundString == "") {
      return;
    }
    if (operator == null) {
      backgroundValue = foregroundValue;
      foregroundString = "";
      operator = newOperator;
      notifyListeners();
      return;
    }
    if (foregroundString == "" && operator != null) {
      operator = newOperator;
      notifyListeners();
      return;
    }

    backgroundValue = _compute();

    foregroundString = "";
    operator = newOperator;
    notifyListeners();
  }

  void clear() {
    operator = null;
    backgroundValue = null;
    foregroundString = "";
    notifyListeners();
  }

  void delete() {
    foregroundString =
        foregroundString.substring(0, foregroundString.length - 1);
    notifyListeners();
  }

  void equals() {
    if (operator == null) {
      return;
    }

    if (backgroundValue != null && foregroundString == "") {
      foregroundString = _makeReadable(backgroundValue);
      operator = null;
      backgroundValue = null;
      notifyListeners();
      return;
    }

    foregroundString = _makeReadable(_compute());
    operator = null;
    backgroundValue = null;
    notifyListeners();
  }
}
