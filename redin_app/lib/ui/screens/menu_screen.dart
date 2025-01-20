import 'package:flutter/material.dart';
import 'package:redin_app/ui/screens/roulette_screen.dart';
import 'package:redin_app/ui/widgets/background_music.dart';
import '../widgets/menu_button.dart';
import '../widgets/animated_route.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundMusic(),
          // Background image
          Image.asset(
            'assets/images/home/home_background.png',
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
                'assets/images/home/welcomeCasino.png',
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          AnimatedRoute(page: const RouletteScreen()),
                        );
                      },
                      imagePath: 'assets/images/home/roulette.png',
                      imageOffset: const Offset(0, 0),
                      imageSize: 150,
                    ),
                    const SizedBox(width: 20),
                    MenuButton(
                      text: 'BLACKJACK',
                      onPressed: () {
                        // Una vez implementes BlackJackScreen, puedes usar AnimatedRoute aquí también
                      },
                      imagePath: 'assets/images/home/blackjack.png',
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
                      text: 'HORSE',
                      onPressed: () {
                        // Lo mismo para HorseScreen
                      },
                      imagePath: 'assets/images/home/horses.png',
                    ),
                    const SizedBox(width: 20),
                    MenuButton(
                      text: 'LUCKY \nWHEEL',
                      lineHeight: 0.6,
                      onPressed: () {
                        // Y para LuckyWheelScreen
                      },
                      imagePath: 'assets/images/home/luckyWheel.png',
                      imageSize: 125,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}