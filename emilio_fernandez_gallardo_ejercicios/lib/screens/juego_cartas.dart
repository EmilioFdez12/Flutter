import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

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
  double puntosJugador = 0.0; // Puntos del jugador
  double puntosMaquina = 0.0; // Puntos de la máquina
  bool finDelJuego = false; // Indicador si el juego ha terminado
  String mensaje = ''; // Mensaje a mostrar
  bool jugadorPlanto = false; // Si el jugador se plantó o no
  final Random random = Random();

  int vidasJugador = 3; // Vidas del jugador
  int vidasMaquina = 3; // Vidas de la máquina

  // Cartas disponibles con su valor correspondiente (solo un palo)
  final List<Map<String, dynamic>> cartas = [
    {'nombre': '1', 'valor': 1.0, 'palo': 'Oros'},
    {'nombre': '2', 'valor': 2.0, 'palo': 'Oros'},
    {'nombre': '3', 'valor': 3.0, 'palo': 'Oros'},
    {'nombre': '4', 'valor': 4.0, 'palo': 'Oros'},
    {'nombre': '5', 'valor': 5.0, 'palo': 'Oros'},
    {'nombre': '6', 'valor': 6.0, 'palo': 'Oros'},
    {'nombre': '7', 'valor': 7.0, 'palo': 'Oros'},
    {'nombre': 'Sota', 'valor': 0.5, 'palo': 'Oros'},
    {'nombre': 'Caballo', 'valor': 0.5, 'palo': 'Oros'},
    {'nombre': 'Rey', 'valor': 0.5, 'palo': 'Oros'},
  ];

  // Mazo de cartas jugables
  List<Map<String, dynamic>> mazo = [];

  bool juegoIniciado = false; // Indicador para saber si el juego ha comenzado

  @override
  void initState() {
    super.initState();
  }

  // Función para reiniciar el juego
  void reiniciarJuego() {
    setState(() {
      puntosJugador = 0.0;
      puntosMaquina = 0.0;
      finDelJuego = false;
      mensaje = 'Comienza el juego';
      jugadorPlanto = false;
      vidasJugador = 3; // Reinicia las vidas del jugador
      vidasMaquina = 3; // Reinicia las vidas de la máquina
      mazo = List.from(cartas);
      mazo.shuffle(random);
    });
  }

  // Función para sacar una carta del mazo
  Map<String, dynamic> sacarCarta() {
    if (mazo.isEmpty) {
      reiniciarJuego();
      return {};
    }
    return mazo.removeLast();
  }

  // Turno del jugador
  void turnoJugador() {
    if (finDelJuego || jugadorPlanto) return;

    Map<String, dynamic> carta = sacarCarta();
    if (carta.isEmpty) return;

    setState(() {
      puntosJugador += carta['valor'];
      mensaje =
          'Sacaste: ${carta['nombre']} de ${carta['palo']} (Valor: ${carta['valor']})';
    });

    if (puntosJugador > 7.5) {
      setState(() {
        finDelJuego = true;
        mensaje = 'Te pasaste de 7.5. ¡Perdiste!';
        vidasJugador--; // Se le quita una vida al jugador
      });
    }
  }

  // Turno del jugador: se planta
  void plantarse() {
    setState(() {
      jugadorPlanto = true;
      mensaje = 'Te plantaste. Ahora es el turno de la máquina.';
    });

    turnoMaquina(); // Empieza el turno de la máquina
  }

  // Turno de la máquina
  void turnoMaquina() {
    if (finDelJuego) return;

    double puntosTemp = puntosMaquina;

    while (puntosTemp < 7.5) {
      Map<String, dynamic> carta = sacarCarta();
      if (carta.isEmpty) break;

      puntosTemp += carta['valor'];
    }

    setState(() {
      puntosMaquina = puntosTemp;
      if (puntosMaquina > 7.5) {
        mensaje = 'La máquina se pasó de 7.5. ¡Ganaste!';
        finDelJuego = true;
        vidasMaquina--; // Se le quita una vida a la máquina
      } else if (puntosJugador > puntosMaquina) {
        mensaje =
            '¡Ganaste! Tienes $puntosJugador puntos, la máquina tiene $puntosMaquina puntos.';
        finDelJuego = true;
      } else if (puntosJugador < puntosMaquina) {
        mensaje =
            '¡Perdiste! Tienes $puntosJugador puntos, la máquina tiene $puntosMaquina puntos.';
        finDelJuego = true;
        vidasJugador--; // Se le quita una vida al jugador
      } else {
        mensaje = 'Empate. Ambos tienen $puntosJugador puntos.';
        finDelJuego = true;
      }
    });
  }

  // Función para iniciar el juego
  void iniciarJuego() {
    setState(() {
      juegoIniciado = true;
      reiniciarJuego();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Juego 7 y Medio"),
      ),
      body: Column(
        children: [
          // Mostrar los corazones en la parte superior de la pantalla
          Padding(
            padding: const EdgeInsets.only(
                top: 40.0,
                left: 20.0, 
                right: 20.0), 
                // Ajusta el padding si es necesario
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Corazones verdes para el jugador
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: List.generate(vidasJugador,
                        (index) => Icon(Icons.favorite, color: Colors.green)),
                  ),
                ),
                // Corazones rojos para la máquina
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: List.generate(vidasMaquina,
                        (index) => Icon(Icons.favorite, color: Colors.red)),
                  ),
                ),
              ],
            ),
          ),
          // Si el juego no ha comenzado, mostramos el botón para jugar
          if (!juegoIniciado)
            ElevatedButton(
              onPressed: iniciarJuego,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Fondo rojo
              ),
              child: Text(
                'Jugar',
                style: GoogleFonts.anton(
                  fontSize: 24,
                  color: Colors.white, // Letras blancas
                ),
              ),
            )
          else ...[
            const SizedBox(height: 20), // Espacio entre los elementos
            Text(
              finDelJuego ? "¡Juego Terminado!" : "MI TURNO",
              style: GoogleFonts.anton(
                fontSize: 34,
                color: Colors.green[400], // Color blanco
              ),
            ),
            const SizedBox(height: 20),
            // Puntos del jugador y la máquina
            Text(
              "Mis Puntos: $puntosJugador\nPuntos de la máquina: $puntosMaquina",
              style: GoogleFonts.poppins(
                fontSize: 22,
                color: Colors.white, // Color blanco
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Mensaje de turno
            Text(
              mensaje,
              style: GoogleFonts.anton(
                fontSize: 28,
                color: Colors.white, // Color blanco
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Botones para sacar carta o plantarse
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: finDelJuego || jugadorPlanto ? null : turnoJugador,
                  child: Text('Sacar Carta'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: finDelJuego || jugadorPlanto ? null : plantarse,
                  child: Text('Plantarse'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Texto de la máquina
          ],
        ],
      ),
    );
  }
}
