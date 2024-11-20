import 'package:flutter/material.dart';
import 'package:relacion1/screens/drawer.dart';

class Clicker extends StatefulWidget {
  const Clicker({super.key});

  @override
  _ClickerState createState() => _ClickerState();
}

class _ClickerState extends State<Clicker> {
  int points = 0;

  // Función para sumar puntos
  void _incrementPoints() {
    setState(() {
      points++;
    });
  }

  // Función para restar puntos
  void _decrementPoints() {
    setState(() {
      if (points > 0) {
        points--;
      }
    });
  }

  // Función para resetear los puntos
  void _resetPoints() {
    setState(() {
      points = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        title: Text("Clicker App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Puntos: $points',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _incrementPoints,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Sumar'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _decrementPoints,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Restar'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _resetPoints,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Resetear'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
