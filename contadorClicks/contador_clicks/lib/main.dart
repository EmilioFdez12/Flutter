import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Emilio Fernández',
      home: MiContador(),
    );
  }
}

class MiContador extends StatefulWidget {
  const MiContador({super.key});

  @override
  State<MiContador> createState() => _MiContadorState();
}

class _MiContadorState extends State<MiContador> {
  int numeroVeces = 0;

  void incrementar() {
    setState(() {
      numeroVeces++;
    });
  }

  void decrementar() {
    setState(() {
      if (numeroVeces == 0) {
        return;
      } else {
        numeroVeces--;
      }
    });
  }

  void resetear() {
    setState(() {
      numeroVeces = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Emilio Fernández")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              numeroVeces == 1
                  ? "Has pulsado 1 vez"
                  : "Has pulsado $numeroVeces veces",
              style: const TextStyle(fontSize: 32),
            ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: incrementar,
                backgroundColor: Colors.red[500],
                child: const Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20),
              FloatingActionButton(
                onPressed: decrementar,
                backgroundColor: Colors.blue[500],
                child: const Icon(
                  Icons.remove,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20),
              FloatingActionButton(
                onPressed: resetear,
                backgroundColor: Colors.green[500],
                child: const Icon(Icons.refresh, size: 30, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
