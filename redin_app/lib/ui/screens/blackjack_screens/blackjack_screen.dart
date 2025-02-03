import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Importar fluttertoast
import 'package:redin_app/logic/blackjack/blackjack_game.dart';
import 'package:redin_app/ui/widgets/blackjack/animated_card.dart';
import 'package:redin_app/utils/database/balance.dart';
import 'package:redin_app/ui/ui.dart';

class BlackJackScreen extends StatefulWidget {
  const BlackJackScreen({super.key, required this.initialBet});

  final int initialBet;

  @override
  _BlackJackScreenState createState() => _BlackJackScreenState();
}

class _BlackJackScreenState extends State<BlackJackScreen> {
  final BlackJackGame _game = BlackJackGame();
  late FToast fToast; // Para manejar los toasts

  @override
  void initState() {
    super.initState();
    fToast = FToast(); // Inicializar FToast
    fToast.init(context); // Asociar FToast con el contexto
    _game.startGame().then((_) => setState(() {}));
  }

  void _showToast(String message, Color backgroundColor) {
    fToast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: backgroundColor,
        ),
        child: Text(
          message,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      gravity: ToastGravity.CENTER, // Mostrar en el centro de la pantalla
      toastDuration: const Duration(seconds: 2), // Duración del toast
    );
  }

  @override
  Widget build(BuildContext context) {
    final balanceProvider = Provider.of<BalanceProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;

    int playerScore = _game.calculateHandValue(_game.playerHand);
    int dealerScore = _game.dealerHand.isNotEmpty
        ? _game.calculateHandValue(
            _game.showDealerCard ? _game.dealerHand : [_game.dealerHand[0]])
        : 0;

    // Mostrar toast cuando el juego termine
    if (_game.gameOver) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_game.result.contains('Ganaste')) {
          _showToast(_game.result, Colors.green); // Toast verde si gana
        } else if (_game.result.contains('Perdiste')) {
          _showToast(_game.result, Colors.red); // Toast rojo si pierde
        } else {
          _showToast(_game.result, Colors.blue); // Toast azul para empate
        }
      });
    }

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/home/home_background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: screenHeight * 0.08,
            left: screenSize.width * 0.1,
            child: CoinDisplay(coins: balanceProvider.balance),
          ),
          Positioned(
            top: screenHeight * 0.2,
            left: 0,
            right: 0,
            child: Center(
              child: _ScoreDisplay(score: dealerScore, color: Colors.red),
            ),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: 0,
            right: 0,
            child: Center(
              child: _ScoreDisplay(score: playerScore, color: Colors.green),
            ),
          ),
          Positioned(
            top: screenHeight * 0.25,
            left: 0,
            right: 0,
            child: Center(
              child: _CardStack(
                cards: _game.dealerHand,
                isFaceUp: (index) => index == 0 || _game.showDealerCard,
                isDealer: true,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.52,
            left: 0,
            right: 0,
            child: Center(
              child: _CardStack(
                cards: _game.playerHand,
                isFaceUp: (index) => true,
                isDealer: false,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.85,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await _game.hit();
                    setState(() {});
                  },
                  child: const Text('Hit'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () async {
                    await _game.stand();
                    setState(() {});
                  },
                  child: const Text('Stand'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardStack extends StatelessWidget {
  final List<String> cards;
  final bool Function(int index) isFaceUp;
  final bool isDealer;

  const _CardStack({
    required this.cards,
    required this.isFaceUp,
    required this.isDealer,
  });

  @override
  Widget build(BuildContext context) {
    const double cardWidth = 100.0; // Ancho de cada carta
    const double overlap = 20.0; // Solapamiento entre cartas
    final double totalWidth = cards.length * (cardWidth - overlap) + overlap;

    return Center(
      child: SizedBox(
        height: 150, // Altura fija para el Stack
        width: totalWidth, // Ancho total del grupo de cartas
        child: Stack(
          children: cards.asMap().entries.map((entry) {
            int index = entry.key;
            String card = entry.value;
            final double offsetX = index * (cardWidth - overlap);

            return Positioned(
              left: offsetX,
              child: AnimatedCard(
                card: card,
                isFaceUp: isFaceUp(index),
                isDealer: isDealer,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _ScoreDisplay extends StatelessWidget {
  final int score;
  final Color color;

  const _ScoreDisplay({required this.score, required this.color});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.black.withOpacity(0.5),
      ),
      child: Text(
        '$score',
        style: TextStyle(
          fontSize: screenWidth * 0.08,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}