import 'package:flutter/material.dart';
import 'package:relacion1/screens/drawer.dart'; 

class Enlace2 extends StatelessWidget {
  const Enlace2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        title: const Text("Segunda pantalla"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Márgenes a los lados
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage("assets/images/alonso.jpg"),
                width: 100,
                height: 250,
              ),
              SizedBox(width: 10), // Espacio entre imágenes
              Image(
                image: AssetImage("assets/images/alonso.jpg"),
                width: 100,
                height: 250,
              ),
              SizedBox(width: 10), // Espacio entre imágenes
              Image(
                image: AssetImage("assets/images/alonso.jpg"),
                width: 100,
                height: 250,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
