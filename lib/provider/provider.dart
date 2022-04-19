import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

import '../constants/utils.dart';
import 'calculator_model.dart';

final calculatorProvider =
    StateNotifierProvider<CalculatorNotifier, Calculator>(
  (ref) => CalculatorNotifier(),
);

class CalculatorNotifier extends StateNotifier<Calculator> {
  CalculatorNotifier() : super(Calculator());
  void delete() {
    final equation = state.equation;

    if (equation.isNotEmpty) {
      final newEquation = equation.substring(0, equation.length - 1);

      if (newEquation.isEmpty) {
        reset();
      } else {
        state = state.copy(equation: newEquation);
        calculate();
      }
    }
  }

  void reset() {
    const equation = '0';
    const result = '0';
    state = state.copy(equation: equation, result: result, allText: '0');
  }

  void resetResult() {
    final equation = state.result;
    // print('resetResult');
    state = state.copy(
      equation: equation,
      shouldAppend: false,
    );
  }

  void appendAllText(String text) {
    state.allText += text;
  }

  void append(String buttonText) {
    appendAllText(buttonText);

    final equation = () {
      if (Utils.isOperator(buttonText) &&
          Utils.isOperatorAtEnd(state.equation)) {
        final newEquation =
            state.equation.substring(0, state.equation.length - 1);

        return newEquation + buttonText;
      } else if (state.shouldAppend) {
        return state.equation == '0' ? buttonText : state.equation + buttonText;
      } else {
        return Utils.isOperator(buttonText)
            ? state.equation + buttonText
            : buttonText;
      }
    }();

    state = state.copy(equation: equation, shouldAppend: true);
    calculate();
  }

  void equals() {
    // print('called equals' + state.equation + ' ' + state.result);
    calculate();
    resetResult();
  }

  void calculate() {
    String expression = state.equation
        .replaceAll('x', '*')
        .replaceAll('÷', '/')
        .replaceAll('–', '-');

    // print('expression-> $expression');
    try {
      final exp = Parser().parse(expression);
      final model = ContextModel();
      // print('exp--> $exp)');

      final result = '${exp.evaluate(EvaluationType.REAL, model)}';
      // print('result-->  ' + result);
      state = state.copy(result: result, allText: state.allText += result);
    } catch (e) {
      // print('caught exception --> ' + e.toString());
    }
  }

  void onClicked(String buttonText) {
    // print('pressing ' + buttonText + '\n');
    // final calculator = state;
    switch (buttonText) {
      case 'AC':
        // print('its ac');
        reset();
        break;
      case '=':
        equals();
        break;
      case '<':
        delete();
        break;
      default:
        append(buttonText);
        break;
    }
    // append(buttonText);
    // print(state.allText);
  }
}
