import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relacion1/screens/drawer.dart';


class Enlace1 extends StatelessWidget {
  const Enlace1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateral(),
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
              // Estilo de el tema de la app
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SelectableText(
              'https://github.com/EmilioFdez12/Flutter',
              style: GoogleFonts.anton(
                fontSize: 14,
                color: Colors.blue[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
