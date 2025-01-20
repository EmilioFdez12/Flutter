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

  const MenuButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 150,
    this.height = 100,
    required this.imagePath,
    this.imageOffset = Offset.zero,
    this.imageSize,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xFF121212),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(175, 255, 255, 255),
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
                style: GoogleFonts.jomhuria(
                  color: textColor,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
