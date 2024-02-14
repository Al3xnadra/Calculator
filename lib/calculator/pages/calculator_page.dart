import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/calculator/widgets/calculator_button.dart';
import 'package:flutter_calculator/calculator/cubit/calculator_cubit.dart';
import 'package:flutter_calculator/calculator/widgets/calculator_text.dart';
import 'package:flutter_calculator/calculator/widgets/long_button.dart';
import 'package:flutter_calculator/data/buttons_list.dart';
import 'package:flutter_calculator/data/injection_containter/injection_containter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  bool isOperator(String x) {
    if (x == '-' || x == '+') {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('Calculator'),
      ),
      body: BlocProvider(
        create: (context) => getIt<CalculatorCubit>(),
        child: BlocBuilder<CalculatorCubit, CalculatorState>(
          builder: (context, state) {
            return Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CalculatorText(
                          text: state.question,
                          fontSize: 30,
                          bottom: 20,
                          textColor: Colors.black),
                      CalculatorText(
                          text: state.finalQuestion,
                          fontSize: 20,
                          bottom: 10,
                          textColor: Colors.grey.shade700),
                      CalculatorText(
                          text: state.answer,
                          fontSize: 30,
                          bottom: 0,
                          textColor: Colors.cyan),
                    ],
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: MasonryGridView.count(
                      crossAxisCount: 4,
                      itemCount: buttons.length,
                      itemBuilder: ((context, index) {
                        if (index == 0) {
                          return CalculatorButton(
                            buttonTap: () {
                              context.read<CalculatorCubit>().clearAll();
                            },
                            buttonText: buttons[index],
                            color: Colors.white,
                          );
                        } else if (index == 3) {
                          return CalculatorButton(
                            buttonTap: () {
                              context.read<CalculatorCubit>().delete();
                            },
                            buttonText: buttons[index],
                            color: Colors.cyan,
                            gradient: Colors.cyan.shade200,
                            secgradient: Colors.cyan.shade400,
                          );
                        } else if (index == buttons.length - 4) {
                          return LongButton(
                            buttonTap: () {
                              context.read<CalculatorCubit>().equalPressed();
                            },
                            buttonText: buttons[index],
                          );
                        } else {
                          return CalculatorButton(
                            buttonTap: () {
                              context
                                  .read<CalculatorCubit>()
                                  .buttons(state.question, buttons, index);
                            },
                            buttonText: buttons[index],
                            color: isOperator(buttons[index])
                                ? Colors.cyan
                                : Colors.white,
                            gradient: isOperator(buttons[index])
                                ? Colors.cyan.shade200
                                : Colors.white,
                            secgradient: isOperator(buttons[index])
                                ? Colors.cyan.shade400
                                : Colors.white,
                          );
                        }
                      })),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
