
import 'package:flutter/material.dart';
import 'package:relacion1/screens/drawer.dart';

class JuegoClicks extends StatelessWidget {
  const JuegoClicks({super.key});
  
  @override
  Widget build(BuildContext context) {
return Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        title: const Text("Juego Clicks"),
      ),
      backgroundColor: const Color(0xFF080808),
      body: Center(
       
      ),
    );
  }
  }
  
