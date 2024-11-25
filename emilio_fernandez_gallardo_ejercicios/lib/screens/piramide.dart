import 'package:flutter/material.dart';
import 'package:relacion1/screens/drawer.dart'; 

class Piramide extends StatelessWidget {
  const Piramide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        title: const Text("Piramide"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tercera fila (1 ícono)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: const [
                    Icon(Icons.phone, size: 50, color: Colors.blue),
                    Text(
                      'Llama por teléfono',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10), // Espacio entre las filas
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: const [
                    Icon(Icons.phone, size: 50, color: Colors.blue),
                    Text(
                      'Llama por teléfono',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(width: 10),

                Column(
                  children: const [
                    Icon(Icons.phone, size: 50, color: Colors.blue),
                    Text(
                      'Llama por teléfono',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10), // Espacio entre las filas
            // Primera fila (3 íconos)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: const [
                    Icon(Icons.phone, size: 50, color: Colors.blue),
                    Text(
                      'Llama por teléfono',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  children: const [
                    Icon(Icons.phone, size: 50, color: Colors.blue),
                    Text(
                      'Llama por teléfono',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  children: const [
                    Icon(Icons.phone, size: 50, color: Colors.blue),
                    Text(
                      'Llama por teléfono',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
