import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.buttonText,
    required this.onPress,
  });

  final String buttonText;
  final void Function() onPress;

  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 4),
          backgroundColor: const Color.fromARGB(255, 69, 39, 176),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
        ));
  }
}
