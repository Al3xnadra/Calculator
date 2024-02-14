part of 'calculator_cubit.dart';

@freezed
class CalculatorState with _$CalculatorState {
  const factory CalculatorState({
    @Default('') String question,
    @Default('') String answer,
    @Default('') String finalQuestion,
  }) = _CalculatorState;
}
