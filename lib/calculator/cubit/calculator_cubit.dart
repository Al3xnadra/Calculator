import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:math_expressions/math_expressions.dart';

part 'calculator_state.dart';
part 'calculator_cubit.freezed.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(const CalculatorState());

  Future<void> clearAll() async {
    emit(const CalculatorState(question: ''));
  }

  Future<void> delete() async {
    emit(CalculatorState(
        question: state.question.substring(0, state.question.length - 1)));
  }

  Future<void> equalPressed() async {
    String finalQuestion = state.question;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    finalQuestion = finalQuestion.replaceAll('÷', '/');
    finalQuestion = finalQuestion.replaceAll('%', '%');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);

    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    emit(
        CalculatorState(answer: eval.toString(), finalQuestion: finalQuestion));
  }

  Future<void> buttons(String question, List<String> buttons, int index) async {
    emit(CalculatorState(
        question: question += buttons[index],
        answer: state.answer,
        finalQuestion: state.finalQuestion));
  }
}
