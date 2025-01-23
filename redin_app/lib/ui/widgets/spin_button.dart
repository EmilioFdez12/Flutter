import 'package:flutter/material.dart';

class SpinButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const SpinButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Obtener el tamaño de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Ajustar el tamaño de la fuente en función del ancho de la pantalla
    final fontSize = screenWidth * 0.06; // 6% del ancho de la pantalla

    // Ajustar el padding en función del ancho y alto de la pantalla
    final verticalPadding = screenHeight * 0.015;
    final horizontalPadding = screenWidth * 0.15;

    // Ajustar el radio de las esquinas en función del ancho de la pantalla
    final borderRadius = screenWidth * 0.5; 

    // Ajustar el grosor del borde en función del ancho de la pantalla
    final borderWidth = screenWidth * 0.01;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
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
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: const Color(0xFFFFFB86),
              width: borderWidth,
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          elevation: 0, // Sin sombra clásica
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black, // Texto en negro
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}