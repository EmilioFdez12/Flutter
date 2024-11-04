import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relacion1/screens/juego.dart';
import 'package:relacion1/screens/screens.dart';

void main() {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/enlace1': (context) => const Enlace1(),
        '/enlace2': (context) => const Enlace2(),
        '/enlace3': (context) => const Enlace3(),
        '/enlace4': (context) => const Enlace4(),
        '/contador': (context) => const Contador(),
        '/instagram': (context) => const Instagram(),
        '/juegoClicks': (context) => const JuegoClicks() ,
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: const Text("Rel1"),
      ),
      backgroundColor: const Color(0xFF080808),
      drawer: const MenuLateral(), // Use MenuLateral here
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Relación 1',
              style: GoogleFonts.anton(
                fontSize: 64,
                color: Colors.red[500],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
