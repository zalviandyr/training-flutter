import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const Button({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.red,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
