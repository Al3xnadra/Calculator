import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  const LongButton({
    super.key,
    required this.buttonText,
    required this.buttonTap,
  });

  final String buttonText;
  final Function() buttonTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTap,
      child: Container(
        height: 200,
        margin: const EdgeInsets.only(right: 5, top: 10, left: 5),
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
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
            colors: [Colors.cyan.shade200, Colors.cyan.shade400],
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
    );
  }
}
