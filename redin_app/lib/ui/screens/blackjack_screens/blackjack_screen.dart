import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redin_app/ui/widgets/blackjack/bet_button.dart';
import 'package:redin_app/utils/database/balance.dart';
import 'package:redin_app/ui/ui.dart';

class BlackJackScreen extends StatefulWidget {
  const BlackJackScreen({super.key, required int initialBet});

  @override
  // ignore: library_private_types_in_public_api
  _BlackJackScreenState createState() => _BlackJackScreenState();
}

class _BlackJackScreenState extends State<BlackJackScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final balanceProvider = Provider.of<BalanceProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      body: Stack(
        children: [
          // Fondo de la pantalla
          Image.asset(
            'assets/images/home/home_background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Display de monedas
          Positioned(
            top: screenHeight * 0.08,
            left: screenWidth * 0.1,
            child: CoinDisplay(coins: balanceProvider.balance),
          ),
          // Lanzador de cartas (ranura)
          Positioned(
            top: screenHeight * 0.45,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/blackjack/table/card_thrower.webp',
                height: screenHeight * 0.01,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Botones de juego
          Positioned(
            top: screenHeight * 0.85,
            left: 0,
            right: 0,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BetButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
