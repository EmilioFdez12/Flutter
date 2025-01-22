import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          borderRadius: BorderRadius.circular(12), // Esquinas ligeramente redondeadas
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
