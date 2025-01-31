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

  int rondasGanadasJugador = 0;
  int rondasGanadasMaquina = 0;

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
        rondasGanadasMaquina++;
      });
    } else if (puntosJugador == 7.5) {
      setState(() {
        mensaje = 'Has llegado a 7.5. Turno de la máquina.';
        jugadorPlanto = true;
      });
      turnoMaquina();
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

    // La máquina juega hasta superar o igualar al jugador, o hasta pasarse de 7.5
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
    if (puntosJugador > 7.5) {
      mensaje = '¡Perdiste!';
      rondasGanadasMaquina++;
    } else if (puntosMaquina > 7.5) {
      mensaje = '¡Ganaste!';
      rondasGanadasJugador++;
    } else if (puntosJugador > puntosMaquina) {
      mensaje = '¡Ganaste!';
      rondasGanadasJugador++;
    } else if (puntosJugador < puntosMaquina) {
      mensaje = '¡Perdiste!';
      rondasGanadasMaquina++;
    } else {
      mensaje = 'Empate';
    }

    finDelJuego = true;

    // Verificar si alguien ganó 5 rondas
    if (rondasGanadasJugador >= 5 || rondasGanadasMaquina >= 5) {
      mensaje = rondasGanadasJugador >= 5
          ? '¡Has ganado 5 rondas! ¡Felicidades!'
          : '¡La máquina ha ganado 5 rondas!';
      finDelJuego = true;
    }
  }

  Widget _mostrarCartas(List<Map<String, dynamic>> cartas, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: cartas
          .map((carta) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 10, right: 10),
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

  Widget _mostrarCorazones(int rondasGanadas, Color color) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          index < rondasGanadas ? Icons.favorite : Icons.favorite_border,
          color: color,
          size: 30,
        ),
      ),
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
        children: [
          // Corazones en la parte superior
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: _mostrarCorazones(rondasGanadasJugador, Colors.green),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: _mostrarCorazones(rondasGanadasMaquina, Colors.red),
                ),
              ],
            ),
          ),
          // Resto del contenido
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (rondasGanadasJugador >= 5 || rondasGanadasMaquina >= 5) ...[
                  Text(
                    mensaje,
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        rondasGanadasJugador = 0;
                        rondasGanadasMaquina = 0;
                        reiniciarJuego();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[400],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                    ),
                    child: const Text(
                      'Reiniciar Partida',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ] else ...[
                  Text(
                    mensaje,
                    style: const TextStyle(fontSize: 22, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text('Tus cartas:',
                      style: const TextStyle(fontSize: 18, color: Colors.white)),
                  _mostrarCartas(cartasJugador, Colors.green),
                  const SizedBox(height: 20),
                  Text('Cartas de la máquina:',
                      style: const TextStyle(fontSize: 18, color: Colors.white)),
                  _mostrarCartas(cartasMaquina, Colors.red),
                  const SizedBox(height: 20),
                  if (!finDelJuego) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: turnoJugador,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[800]),
                          child: const Text('Sacar Carta',
                              style: TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: plantarse,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[800]),
                          child: const Text('Plantarse',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ] else ...[
                    ElevatedButton(
                      onPressed: reiniciarJuego,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[400]),
                      child: const Text('Jugar de nuevo',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}