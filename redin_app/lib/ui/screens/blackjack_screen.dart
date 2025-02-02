import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:redin_app/logic/blackjack/blackjack_card.dart';
import 'package:redin_app/logic/blackjack/blackjack_logic.dart';
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

    // Estado para controlar si el botón de START está visible
    final showStartButton = useState(true);

    // Estado para las manos del jugador y del dealer
    final game = useState<BlackjackGame?>(null);
    final playerHand = useState<List<BlackJackCard>>([]);
    final dealerHand = useState<List<BlackJackCard>>([]);

    void startGame() {
      print("Iniciando el juego...");
      try {
        game.value = BlackjackGame();
        print("Juego inicializado. Repartiendo cartas...");
        playerHand.value = game.value!.playerHand;
        dealerHand.value = game.value!.dealerHand;

        print("Cartas del jugador:");
        for (var card in playerHand.value) {
          print("${card.rank} of ${card.suit} - Ruta: ${card.imagePath}");
        }

        print("Cartas del dealer:");
        for (var card in dealerHand.value) {
          print("${card.rank} of ${card.suit} - Ruta: ${card.imagePath}");
        }

        showStartButton.value = false;
        print("Botón de START ocultado. Juego listo.");
      } catch (e) {
        print("Error al iniciar el juego: $e");
      }
    }

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
          // Botón de START
          if (showStartButton.value)
            Positioned(
              top: screenHeight * 0.45,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: startGame,
                  child: Image.asset(
                    'assets/images/blackjack/table/StartBtn.webp',
                    height: screenHeight * 0.1,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          // Cartas del jugador
          Positioned(
            top: screenHeight * 0.6,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: playerHand.value.map((card) {
                  return Image.asset(
                    card.imagePath,
                    height: screenHeight * 0.12,
                  );
                }).toList(),
              ),
            ),
          ),
          // Cartas del dealer
          Positioned(
            top: screenHeight * 0.2,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: dealerHand.value.map((card) {
                  return Image.asset(
                    card.imagePath,
                    height: screenHeight * 0.12,
                  );
                }).toList(),
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
