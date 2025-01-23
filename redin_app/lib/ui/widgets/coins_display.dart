import 'package:flutter/material.dart';

class CoinDisplay extends StatelessWidget {
  final int coins;

  const CoinDisplay({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    // Obtener el tamaño de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Ajustar el tamaño de la fuente en función del ancho de la pantalla
    final fontSize = screenWidth * 0.06; 

    // Ajustar el padding en función del ancho de la pantalla
    final horizontalPadding = screenWidth * 0.05;
    final verticalPadding = screenHeight * 0.01;

    // Ajustar el tamaño de la imagen en función del ancho de la pantalla
    final imageSize = screenWidth * 0.15;

    return Stack(
      clipBehavior:
          Clip.none, // Permite que los widgets sobresalgan del área del Stack
      alignment: Alignment.center,
      children: [
        // Fondo con borde blanco
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF515151),
                Color(0xFF000000),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Colors.white,
              width: 2, // Grosor del borde
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding * 2.5, vertical: verticalPadding),
            child: Text(
              '$coins',
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        // Imagen que sobresale
        Positioned(
          left: -imageSize * 0.3, // Ajusta cuánto sobresale la imagen
          child: Image.asset(
            'assets/images/redin_logo.png',
            width: imageSize,
            height: imageSize,
          ),
        ),
      ],
    );
  }
}