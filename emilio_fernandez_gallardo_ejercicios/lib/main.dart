import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relacion1/screens/piramide.dart';
import 'package:relacion1/screens/screens.dart';

void main() {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Relación Ejercicios',
      initialRoute: '/',
      theme: ThemeData(
        // Color de fondo de la pantalla
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: AppBarTheme(
          // Color de la AppBar
          backgroundColor: Colors.blue[400], 
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.anton(
            fontSize: 32,
            color: const Color.fromARGB(255, 206, 206, 206),
          ),
          // Puedes agregar más estilos de texto aquí si lo necesitas
        ),
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        '/enlace1': (context) => const Enlace1(),
        '/enlace2': (context) => const Enlace2(),
        '/enlace3': (context) => const Enlace3(),
        '/enlace4': (context) => const Enlace4(),
        '/enlace5': (context) => const Enlace5(),
        '/piramide': (context) => const Piramide(),
        '/instagram': (context) => const Instagram(),
        '/juegoClicks': (context) => const JuegoClicks(),
        '/clicker': (context) => const Clicker(),
      },
    );
  }
}
