import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "./screens/MenuLateral.dart";

void main(List<String> args) => runApp(const Principal());

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[400],
          title: Text("Rel1"),
        ),
        backgroundColor: const Color(0xFF080808),
        drawer: const MenuLateral(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Relación 1',
                style: GoogleFonts.anton(
                  fontSize: 64,
                  color: Colors.red[500]
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
