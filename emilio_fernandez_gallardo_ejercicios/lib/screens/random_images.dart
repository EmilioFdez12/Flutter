import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'package:relacion1/screens/screens.dart';

class JuegoClicks extends StatefulWidget {
  const JuegoClicks({super.key});

  @override
  _JuegoClicksState createState() => _JuegoClicksState();
}

class _JuegoClicksState extends State<JuegoClicks> {
  int points = 0;
  bool pulsado = false;
  late Timer _timer;
  final Duration timeLimit = const Duration(seconds: 1);
  double imageX = 0.0;
  double imageY = 0.0;
  late String currentImage;

  final List<String> images = [
    'assets/images/juegoClicks/serio.jpg',
    'assets/images/juegoClicks/alien.jpg',
    'assets/images/juegoClicks/alonso.jpg',
    'assets/images/juegoClicks/asbulla.jpg',
    'assets/images/juegoClicks/bottas.jpg',
    'assets/images/juegoClicks/hamilton.jpg',
    'assets/images/juegoClicks/kun.jpg',
    'assets/images/juegoClicks/asno.jpg',
    'assets/images/juegoClicks/lebron.jpg',
    'assets/images/juegoClicks/logan.jpg',
    'assets/images/juegoClicks/mikel.jpg',
    'assets/images/juegoClicks/norris.jpg',
    'assets/images/juegoClicks/serio.jpg',
    'assets/images/juegoClicks/si.jpg'
  ];

  @override
  void initState() {
    super.initState();
    currentImage = images[0];
    startTimer();
    moveImage();
  }

  void startTimer() {
    _timer = Timer.periodic(timeLimit, (timer) {
      if (!pulsado) {
        setState(() {
          points -= 2;
        });
      }
      pulsado = false;
      moveImage();
    });
  }

  void moveImage() {
    Random random = Random();
    setState(() {
      imageX = random.nextDouble() * 0.8; 
      imageY = random.nextDouble() * 0.8; 
      currentImage = images[random.nextInt(images.length)];
    });
  }

  void resetTimer() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(
        title: Text("Juego Clicks"),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: MediaQuery.of(context).size.width * 0.05,
            child: Text(
              'Puntos: $points',
               style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Positioned(
            left: imageX * MediaQuery.of(context).size.width,
            top: imageY * MediaQuery.of(context).size.height,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  points++;
                  pulsado = true;
                });
                resetTimer();
                moveImage();
              },
              child: Image.asset(
                currentImage,
                width: 100,
                height: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
