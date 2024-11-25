import 'package:flutter/material.dart';
import 'package:relacion1/screens/drawer.dart'; 

class Enlace5 extends StatelessWidget {
  const Enlace5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        title: const Text("Quinta pantalla"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(40),
          width: 300,
          height: 90,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xFF4AAEFD), // Blue
            borderRadius: BorderRadius.circular(45),
          ),
          child: Container(
            width: 210,
            height: 90,
            decoration: BoxDecoration(
              color: Color(0xFF94CCF9), // Light blue
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                bottomLeft: Radius.circular(45),
              ),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Challenge',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
