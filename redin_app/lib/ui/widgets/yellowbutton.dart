import 'package:flutter/material.dart';

class YellowButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const YellowButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFEFFF11),
            blurRadius: 10,
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEFFF11),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: const BorderSide(
              color: Color(0xFFFFFB86),
              width: 4,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 64),
          elevation: 0, // Sin sombra clásica
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.black, // Texto en negro
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
