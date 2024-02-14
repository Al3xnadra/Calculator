import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.buttonText,
    required this.color,
    required this.buttonTap,
    this.gradient = Colors.white,
    this.secgradient = Colors.white,
  });

  final String buttonText;
  final Color color, gradient, secgradient;
  final Function() buttonTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTap,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                offset: const Offset(5, 5),
                blurRadius: 15,
                spreadRadius: 1,
              ),
              const BoxShadow(
                color: Colors.white,
                offset: Offset(-5, -5),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
            gradient: LinearGradient(
              colors: [gradient, secgradient],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.1, 0.9],
            ),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
