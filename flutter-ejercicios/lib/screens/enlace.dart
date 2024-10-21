import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Enlace1 extends StatelessWidget {
  const Enlace1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Primera pantalla"),
      ),
      backgroundColor: const Color(0xFF080808),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Emilio Fernández Gallardo',
              style: GoogleFonts.lexend(
                fontSize: 30,
                color: Colors.red[500],
              ),
              textAlign: TextAlign.center,
            ),
            SelectableText(
              'https://github.com/EmilioFdez12/2DAM/tree/main/P.Multimedia',
              style: GoogleFonts.anton(
                fontSize: 14,
                color: const Color(0xFFF1F1F1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
