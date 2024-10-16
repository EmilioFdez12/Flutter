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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Emilio Fernández")),
      ),
      body: Center(
        child: Text(
          "Has pulsado $numeroVeces veces",
          style: const TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: 
      ElevatedButton(    
        onPressed: incrementar,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red[500],
          foregroundColor: Colors.white,
          minimumSize: const Size(50, 35),
          padding: const EdgeInsets.all(25),
           shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Bordes redondeados
          ),
          textStyle: const TextStyle(fontSize: 24),
        ),
        child: const Text("Sumar"),

      ),
    );
  }
}
