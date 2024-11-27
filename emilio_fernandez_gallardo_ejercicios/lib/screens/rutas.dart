import 'package:flutter/material.dart';
import 'package:relacion1/screens/screens.dart';

class AppRoutes {
  // Define las rutas nombradas
  static const String home = '/';
  static const String enlace1 = '/enlace1';
  static const String enlace2 = '/enlace2';
  static const String enlace3 = '/enlace3';
  static const String enlace4 = '/enlace4';
  static const String enlace5 = '/enlace5';
  static const String piramide = '/piramide';
  static const String instagram = '/instagram';
  static const String juegoClicks = '/juegoClicks';
  static const String clicker = '/clicker';
  static const String juegoCartas = '/juegoCartas';

  // Mapa de rutas a pantallas
  static final Map<String, Widget Function(BuildContext)> _routes = {
    home: (_) => const HomeScreen(),
    enlace1: (_) => const Enlace1(),
    enlace2: (_) => const Enlace2(),
    enlace3: (_) => const Enlace3(),
    enlace4: (_) => const Enlace4(),
    enlace5: (_) => const Enlace5(),
    piramide: (_) => const Piramide(),
    instagram: (_) => const Instagram(),
    juegoClicks: (_) => const JuegoClicks(),
    clicker: (_) => const Clicker(),
    juegoCartas: (_) => const JuegoCartas(),
  };

  // Función para generar las rutas
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final builder = _routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(builder: builder);
    }
    return MaterialPageRoute(builder: (_) => const HomeScreen());
  }
}
