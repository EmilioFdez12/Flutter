import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redin_app/ui/screens/roulette_screen.dart';
import 'package:redin_app/ui/widgets/animated_route.dart';
import 'package:redin_app/ui/widgets/coins_display.dart';
import 'package:redin_app/ui/widgets/menu_button.dart';
import 'package:redin_app/utils/database/balance.dart';
import 'package:redin_app/utils/music/music_manager.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late AudioManager audioManager;

  @override
  void initState() {
    super.initState();
    audioManager = AudioManager();
    audioManager.playBackgroundMusic();
  }

  @override
  void dispose() {
    audioManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final balanceProvider = Provider.of<BalanceProvider>(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/images/home/home_background.png',
            fit: BoxFit.cover,
            width: screenSize.width,
            height: screenSize.height,
          ),
          Positioned(
            top: screenSize.height * 0.1,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/home/welcomeCasino.png',
                height: screenSize.height * 0.2,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Coin Display
          Positioned(
            bottom: screenSize.height * 0.55,
            left: 0,
            right: 0,
            child: Center(
              child: CoinDisplay(coins: balanceProvider.balance),
            ),
          ),
          Positioned(
            bottom: screenSize.height * 0.15,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.4,
                      child: MenuButton(
                        text: 'ROULETTE',
                        onPressed: () {
                          Navigator.push(
                            context,
                            AnimatedRoute(page: const RouletteScreen()),
                          );
                        },
                        imagePath: 'assets/images/home/roulette.png',
                        imageSize: screenSize.width * 0.4,
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.05),
                    SizedBox(
                      width: screenSize.width * 0.4,
                      child: MenuButton(
                        text: 'BLACK\nJACK',
                        onPressed: () {},
                        imagePath: 'assets/images/home/blackjack.png',
                        imageSize: screenSize.width * 0.45,
                        imageOffset: Offset(0, screenSize.height * -0.038),
                        lineHeight: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.4,
                      child: MenuButton(
                        text: 'HORSE',
                        onPressed: () {},
                        imagePath: 'assets/images/home/horses.png',
                        imageSize: screenSize.width * 0.3,
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.05),
                    SizedBox(
                      width: screenSize.width * 0.4,
                      child: MenuButton(
                        text: 'LUCKY\nWHEEL',
                        onPressed: () {},
                        imagePath: 'assets/images/home/luckyWheel.png',
                        imageSize: screenSize.width * 0.3,
                        lineHeight: 1,
                      ),
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