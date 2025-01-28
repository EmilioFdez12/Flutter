import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSquareButton extends StatelessWidget {
  final Color color;
  final String label;
  final VoidCallback onPressed;
  final bool isActive; // Nuevo parámetro para indicar si está activo

  const CustomSquareButton({
    super.key,
    required this.color,
    required this.label,
    required this.onPressed,
    this.isActive = false, // Valor predeterminado como inactivo
  });

  @override
  Widget build(BuildContext context) {
    // Obtenemos el tamaño de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final fontSize = screenWidth * 0.035;
    final verticalPadding = screenHeight * 0.018;
    final horizontalPadding = screenWidth * 0.06;
    final borderRadius = screenWidth * 0.03;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          border: isActive
              ? Border.all(color: Colors.yellow, width: 3) // Borde amarillo si está activo
              : Border.all(color: Colors.transparent, width: 0),
          boxShadow: isActive
              ? [
                  const BoxShadow(
                    color: Colors.yellow, 
                    blurRadius: 10,
                    spreadRadius: 0,
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
