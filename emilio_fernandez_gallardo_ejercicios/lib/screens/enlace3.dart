import 'package:flutter/material.dart';
import 'package:relacion1/screens/drawer.dart';


class Enlace3 extends StatelessWidget {
  const Enlace3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        title: const Text("Tercera pantalla"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage("assets/images/alonso.jpg"), width: 300, height: 200),
            SizedBox(width: 10),
            Image(image: AssetImage("assets/images/alonso.jpg"), width: 300, height: 200),
            SizedBox(width: 10),
            Image(image: AssetImage("assets/images/alonso.jpg"), width: 300, height: 200),
          ],
        ),
      ),
    );
  }
}
