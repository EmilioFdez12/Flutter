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
    // Obtener el tamaño de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Ajustar el tamaño de la fuente en función del ancho de la pantalla
    final fontSize = screenWidth * 0.035;

    // Ajustar el padding en función del ancho y alto de la pantalla
    final verticalPadding = screenHeight * 0.015; 
    final horizontalPadding = screenWidth * 0.03; 

    // Ajustar el radio de las esquinas en función del ancho de la pantalla
    final borderRadius = screenWidth * 0.03; 

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius), // Esquinas redondeadas dinámicas
        ),
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}