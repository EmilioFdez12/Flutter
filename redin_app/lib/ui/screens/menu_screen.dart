import 'package:flutter/material.dart';
import '../widgets/audio_mamanger.dart';
import '../widgets/menu_button.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
    // Iniciar la música de fondo cuando se construye la pantalla
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      AudioManager().playBackgroundMusic('assets/audio/casino.mp3');
    });
  }

  @override
  void dispose() {
    // Detener la música cuando la pantalla se destruye
    AudioManager().stopBackgroundMusic();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Image.asset(
            'assets/images/home_background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/welcomeCasino.png',
                height: 200,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MenuButton(
                      text: 'ROULETTE',
                      onPressed: () {},
                      imagePath: 'assets/images/roulette.png',
                      imageOffset: const Offset(0, 0),
                      imageSize: 150,
                    ),
                    const SizedBox(width: 20),
                    MenuButton(
                      text: 'BLACKJACK',
                      onPressed: () {},
                      imagePath: 'assets/images/blackjack.png',
                      imageOffset: const Offset(0, -28),
                      imageSize: 150,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MenuButton(
                      text: 'SLOTS',
                      onPressed: () {},
                      imagePath: 'assets/images/slots.png',
                    ),
                    const SizedBox(width: 20),
                    MenuButton(
                      text: 'HORSES',
                      onPressed: () {},
                      imagePath: 'assets/images/horses.png',
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                MenuButton(
                  text: 'LUCKY WHEEL',
                  width: 325,
                  height: 100,
                  onPressed: () {},
                  imagePath: 'assets/images/horses.png',
                  imageSize: 80,
                  imageOffset: const Offset(20, 0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}