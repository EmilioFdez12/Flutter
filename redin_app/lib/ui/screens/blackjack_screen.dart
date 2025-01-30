import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:redin_app/ui/widgets/blackjack/bet_button.dart';
import 'package:redin_app/utils/database/balance.dart';
import 'package:redin_app/ui/ui.dart';

class BlackJackScreen extends HookWidget {
  const BlackJackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final balanceProvider = Provider.of<BalanceProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final coinValue = useState(0);

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
          // Lanzador de cartas
          Positioned(
            top: screenHeight * 0.5,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/blackjack/table/card_thrower.webp',
                height: screenHeight * 0.01, // Ajusta este valor según sea necesario
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Selector de monedas
          Positioned(
            top: screenHeight * 0.75,
            left: 0,
            right: 0,
            child: Center(
              child: CoinSelector(
                coinValue: coinValue.value,
                onCoinChanged: (value) {
                  coinValue.value = value;
                },
              ),
            ),
          ),
          // Botones de apuesta (HIT, STAND, DOUBLE)
                    // Fila de botones de acción (HIT, ROUND GREEN, ROUND ORANGE, STAND)
          Positioned(
            top: screenHeight * 0.85, // Justo debajo del CoinSelector
            left: 0,
            right: 0,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BetButtons()
              ],
            ),
          ),

        ],
      ),
    );
  }
}