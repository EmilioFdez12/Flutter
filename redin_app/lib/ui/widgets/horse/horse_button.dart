import 'package:flutter/material.dart';

class ColorSquareButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final bool isActive;

  const ColorSquareButton({
    super.key,
    required this.color,
    required this.onPressed,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    // Obtenemos el tamaño de la pantalla
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    final buttonSize = screenWidth * 0.15;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive
                ? const Color.fromARGB(255, 255, 255, 255)
                : Colors.white,
            width: isActive ? 4 : 2,
          ),
          boxShadow: isActive
              // Si esta activo, añadimos una sombra
              ? [
                  BoxShadow(
                    color: const Color.fromARGB(255, 255, 255, 255)
                        .withOpacity(0.6),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ]
              // Si no está activo, no hacemos nada
              : [],
        ),
      ),
    );
  }
}
