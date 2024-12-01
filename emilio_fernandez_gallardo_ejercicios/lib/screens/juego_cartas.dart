import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'package:relacion1/screens/drawer.dart';

void main() {
  runApp(const MaterialApp(
    home: JuegoCartas(),
  ));
}

class JuegoCartas extends StatefulWidget {
  const JuegoCartas({super.key});

  @override
  _JuegoCartasState createState() => _JuegoCartasState();
}

class _JuegoCartasState extends State<JuegoCartas> {
  double puntosJugador = 0.0;
  double puntosMaquina = 0.0;
  bool finDelJuego = false;
  String mensaje = '';
  bool jugadorPlanto = false;
  final Random random = Random();

  final List<Map<String, dynamic>> cartas = [
    {'nombre': '1', 'valor': 1.0},
    {'nombre': '2', 'valor': 2.0},
    {'nombre': '3', 'valor': 3.0},
    {'nombre': '4', 'valor': 4.0},
    {'nombre': '5', 'valor': 5.0},
    {'nombre': '6', 'valor': 6.0},
    {'nombre': '7', 'valor': 7.0},
    {'nombre': 'Sota', 'valor': 0.5},
    {'nombre': 'Caballo', 'valor': 0.5},
    {'nombre': 'Rey', 'valor': 0.5},
  ];
  List<Map<String, dynamic>> mazo = [];
  List<Map<String, dynamic>> cartasJugador = [];
  List<Map<String, dynamic>> cartasMaquina = [];

  @override
  void initState() {
    super.initState();
    reiniciarJuego();
  }

  void reiniciarJuego() {
    setState(() {
      puntosJugador = 0.0;
      puntosMaquina = 0.0;
      finDelJuego = false;
      mensaje = 'Comienza el juego';
      jugadorPlanto = false;
      cartasJugador.clear();
      cartasMaquina.clear();
      mazo = List.from(cartas);
      mazo.shuffle(random);
    });
  }

  Map<String, dynamic> sacarCarta() {
    if (mazo.isEmpty) {
      reiniciarJuego();
      return {};
    }
    return mazo.removeLast();
  }

  void turnoJugador() {
    if (finDelJuego || jugadorPlanto) return;

    Map<String, dynamic> carta = sacarCarta();
    if (carta.isEmpty) return;

    setState(() {
      puntosJugador += carta['valor'];
      cartasJugador.add(carta);
      mensaje = 'Puntos: $puntosJugador';
    });

    if (puntosJugador > 7.5) {
      setState(() {
        finDelJuego = true;
        mensaje = '¡Perdiste!';
        
      });
    }

    // Si el jugador tiene 7.5 exactamente, gana
    if (puntosJugador == 7.5) {
      setState(() {
        finDelJuego = true;
        mensaje = '¡Ganaste!';
      });
    }
  }

  void plantarse() {
    setState(() {
      jugadorPlanto = true;
      mensaje = 'Turno de la máquina.';
    });

    turnoMaquina();
  }

  void turnoMaquina() async {
    if (finDelJuego) return;

    double puntosTemp = puntosMaquina;

    // Aquí la máquina no va a contar la última carta del jugador si se plantó
    List<Map<String, dynamic>> cartasJugadorSinUltima = List.from(cartasJugador);
    if (jugadorPlanto) {
      // Elimina la última carta del jugador de la lista para que no se cuente
      cartasJugadorSinUltima.removeLast();
    }

    // La máquina toma cartas, pero no tiene en cuenta la última del jugador
    while (puntosTemp <= puntosJugador && puntosTemp < 7.5) {
      await Future.delayed(const Duration(seconds: 2));
      Map<String, dynamic> carta = sacarCarta();
      if (carta.isEmpty) break;

      setState(() {
        puntosTemp += carta['valor'];
        cartasMaquina.add(carta);
      });

      if (puntosTemp > 7.5) break;
    }

    setState(() {
      puntosMaquina = puntosTemp;
      evaluarResultado();
    });
  }

void evaluarResultado() {
  if (puntosMaquina > 7.5) {
    mensaje = '¡Ganaste!';
  } else if (puntosJugador > puntosMaquina) {
    mensaje =
        '¡Ganaste!';
  } else if (puntosJugador < puntosMaquina) {
    mensaje =
        '¡Perdiste!';
  } else {
    mensaje = 'Perdiste';
  }

  finDelJuego = true;
}


  Widget mostrarCartas(List<Map<String, dynamic>> cartas, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: cartas
          .map((carta) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  carta['valor'].toString(),
                  style: const TextStyle(fontSize: 32, color: Colors.white),
                ),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        title: const Text("Juego Siete y Medio"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            mensaje,
            style: const TextStyle(fontSize: 22, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Text('Tus cartas:', style: const TextStyle(fontSize: 18, color: Colors.white)),
          mostrarCartas(cartasJugador, Colors.green),
          const SizedBox(height: 20),
          Text('Cartas de la máquina:', style: const TextStyle(fontSize: 18, color: Colors.white)),
          mostrarCartas(cartasMaquina, Colors.red),
          const SizedBox(height: 20),
          if (!finDelJuego) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: turnoJugador,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
                  child: const Text('Sacar Carta', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: plantarse,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
                  child: const Text('Plantarse', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ] else ...[
            ElevatedButton(
              onPressed: reiniciarJuego,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[400]),
              child: const Text('Jugar de nuevo', style: TextStyle(color: Colors.white)),
            ),
          ],
        ],
      ),
    );
  }
}
