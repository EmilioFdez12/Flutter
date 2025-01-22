import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final String imagePath;
  final Offset imageOffset;
  final double? imageSize;
  final Color textColor;
  final double? lineHeight;

  const MenuButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 120,
    this.height = 120,
    required this.imagePath,
    this.imageOffset = Offset.zero,
    this.imageSize,
    this.textColor = const Color.fromARGB(255, 224, 255, 215),
    this.lineHeight,
  });

  @override
  Widget build(BuildContext context) {
    // Obtener el ancho de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;

    // Calcular el tamaño del texto en función del ancho de la pantalla
    final textSize = screenWidth * 0.05; // Ajusta este valor según tus necesidades

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xFF000000),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 0, 0, 0),
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: imageOffset.dx,
              top: imageOffset.dy,
              child: Image.asset(
                imagePath,
                width: imageSize ?? (width * 1),
                height: imageSize ?? (height * 1),
                fit: BoxFit.contain,
              ),
            ),
            Center(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontSize: textSize * 1.1,
                  fontWeight: FontWeight.w900,
                  height: lineHeight,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}