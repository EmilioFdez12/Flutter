import 'package:flutter/material.dart';
import 'package:relacion1/screens/drawer.dart';

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _MiContadorState();
}

class _MiContadorState extends State<Contador> {
  int numeroVeces = 0;

  void incrementar() {
    setState(() {
      numeroVeces++;
    });
  }

  void decrementar() {
    setState(() {
      if (numeroVeces > 0) {
        numeroVeces--;
      }
    });
  }

  void resetear() async {
    final shouldReset = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmar reinicio'),
          content: const Text('¿Estás seguro de que deseas reiniciar el contador?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Reiniciar'),
            ),
          ],
        );
      },
    );

    if (shouldReset == true) {
      setState(() {
        numeroVeces = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        title: const Center(child: Text("Contador")),
        automaticallyImplyLeading: true,
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
                tooltip: 'Incrementar',
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
                tooltip: 'Decrementar',
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
                tooltip: 'Reiniciar',
                child: const Icon(Icons.refresh, size: 30, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
