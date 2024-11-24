import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        scaffoldBackgroundColor: const Color(0xFF121212), // Color de fondo de la pantalla
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[400], // Color de la AppBar
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
        '/instagram': (context) => const Instagram(),
        '/juegoClicks': (context) => const JuegoClicks(),
        '/clicker': (context) => const Clicker(),
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
        title: const Text("Rel1"),
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Relación 1',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge, // Aplica el estilo titleLarge definido en el tema
            ),
          ],
        ),
      ),
    );
  }
}
