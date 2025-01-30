import 'package:flutter/material.dart';

class BetButtons extends StatelessWidget {
  const BetButtons({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtenemos el tamaño de la pantalla
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    // Tamaños responsive para los botones
    final buttonWidth = screenWidth * 0.2;
    final buttonHeight = screenHeight * 0.1;
    final roundButtonSize = screenWidth * 0.15;
    final fontSize = screenWidth * 0.05; // Tamaño de fuente responsive

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Botón HIT (rectangular, azul)
        _buildButton(
          text: "HIT",
          color: Colors.blue,
          borderColor: Colors.blue[300]!,
          width: buttonWidth * 1.2,
          height: buttonHeight * 0.6,
          isRound: false,
          fontSize: fontSize, // Pasamos el fontSize aquí
          onPressed: () {
            print("Botón HIT presionado");
          },
        ),
        const SizedBox(width: 10),
        // Botón X2 (redondo, naranja)
        _buildButton(
          text: "X2",
          color: Colors.yellow,
          borderColor: Colors.yellow[300]!,
          width: roundButtonSize,
          height: roundButtonSize,
          isRound: true, // Redondo
          fontSize: fontSize, // Pasamos el fontSize aquí
          onPressed: () {
            print("Botón X2 presionado");
          },
        ),
        const SizedBox(width: 10),
        // Botón /2 (redondo, verde)
        _buildButton(
          text: "/2",
          color: Colors.green,
          borderColor: Colors.green[300]!,
          width: roundButtonSize,
          height: roundButtonSize,
          isRound: true, // Redondo
          fontSize: fontSize, // Pasamos el fontSize aquí
          onPressed: () {
            print("Botón /2 presionado");
          },
        ),
        const SizedBox(width: 10),
        // Botón STAND (rectangular, rojo)
        _buildButton(
          text: "STAND",
          color: Colors.red,
          borderColor: Colors.red[300]!,
          width: buttonWidth * 1.2,
          height: buttonHeight * 0.6,
          isRound: false,
          fontSize: fontSize, // Pasamos el fontSize aquí
          onPressed: () {
            print("Botón STAND presionado");
          },
        ),
      ],
    );
  }

  ///
  /// Método para construir un botón
  ///
  Widget _buildButton({
    required String text,
    required Color color,
    required Color borderColor,
    required double width,
    required double height,
    required bool isRound,
    required double fontSize, // Añadimos fontSize como parámetro
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: isRound
              ? BorderRadius.circular(height / 2)
              : BorderRadius.circular(12),
          border: Border.all(
            color: borderColor, // Color del borde
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
