import 'package:flutter/material.dart';

class CustomSquareButton extends StatelessWidget {
  final Color color;
  final String label;
  final VoidCallback onPressed;

  const CustomSquareButton({
    super.key,
    required this.color,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4), // Esquinas ligeramente redondeadas
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
