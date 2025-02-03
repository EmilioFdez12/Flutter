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
  initialRoute: AppRoutes.home, // Usar la constante definida en AppRoutes
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue[400],
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 24,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.anton(
        fontSize: 32,
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
    ),
  ),
  onGenerateRoute: AppRoutes.generateRoute
    );
  }
}
