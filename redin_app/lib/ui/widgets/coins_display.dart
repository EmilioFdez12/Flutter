import 'package:flutter/material.dart';

class CoinDisplay extends StatelessWidget {
  final int coins;

  const CoinDisplay({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
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
                Color(0xFF515151), // Gris (#515151)
                Color(0xFF000000), // Negro (#000000)
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
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 2),
            child: Text(
              '$coins',
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        // Imagen que sobresale
        Positioned(
          left: -20, // Ajusta cuánto sobresale la imagen
          child: Image.asset(
            'assets/images/redin_logo.png',
            width: 64,
            height: 64,
          ),
        ),
      ],
    );
  }
}
