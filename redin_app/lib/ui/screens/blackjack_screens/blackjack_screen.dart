// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:redin_app/logic/blackjack/blackjack_game_logic.dart';
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
  late FToast fToast;
  bool _resultProcessed = false;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    _game.startGame(() {
      setState(() {});
    });
  }

  void _showToast(String message, Color backgroundColor, BuildContext context) {
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
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 2),
    );

    // Esperar la duración del Toast y luego navegar
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // Eliminar BlackJackScreen de la pila
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BlackJackBetScreen(),
        ),
      );
    });
  }

  void _handleGameResult(String result, BuildContext context) {
    if (!_resultProcessed) {
      final balanceProvider =
          Provider.of<BalanceProvider>(context, listen: false);
      if (result.contains('Ganaste')) {
        balanceProvider.addCoins(widget.initialBet * 2);
      } else if (result.contains('Empate')) {
        balanceProvider.addCoins(widget.initialBet);
      }
      _resultProcessed = true;
    }
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

    if (_game.gameOver && !_resultProcessed) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _handleGameResult(_game.result, context);
        if (_game.result.contains('Ganaste')) {
          _showToast(_game.result, Colors.green, context);
        } else if (_game.result.contains('Perdiste')) {
          _showToast(_game.result, Colors.red, context);
        } else {
          _showToast(_game.result, Colors.blue, context);
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
              left: screenSize.width * 0.3,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 2.0),
                  color: Colors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'DEALER',
                  style: GoogleFonts.poppins(
                    fontSize: screenHeight * 0.04,
                    fontWeight: FontWeight.w900,
                    color: Colors.red,
                  ),
                ),
              )),
          Positioned(
            top: screenHeight * 0.33,
            left: screenSize.width * 0.7,
            child: _ScoreDisplay(score: dealerScore, color: Colors.red),
          ),
          Positioned(
            top: screenHeight * 0.2,
            left: screenSize.width * 0.12,
            child: _CardStack(
              cards: _game.dealerHand,
              isFaceUp: (index) => index == 0 || _game.showDealerCard,
              isDealer: true,
            ),
          ),
          Positioned(
            top: screenHeight * 0.65,
            left: screenSize.width * 0.1,
            child: _ScoreDisplay(score: playerScore, color: Colors.green),
          ),
          Positioned(
            top: screenHeight * 0.5,
            left: screenSize.width * 0.35,
            child: _CardStack(
              cards: _game.playerHand,
              isFaceUp: (index) => true,
              isDealer: false,
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

class _ScoreDisplay extends StatelessWidget {
  final int score;
  final Color color;

  const _ScoreDisplay({required this.score, required this.color});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        // Borde blanco
        Text(
          '$score',
          style: TextStyle(
            fontSize: screenWidth * 0.16,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 4
              ..color = Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Texto principal
        Text(
          '$score',
          style: TextStyle(
            fontSize: screenWidth * 0.16,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
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
    const double cardWidth = 100.0;
    const double cardHeight = 150.0;
    const double verticalOverlap = 10.0;
    const double horizontalOffset = 32.0;

    return Center(
      child: SizedBox(
        height: cardHeight + (cards.length - 1) * verticalOverlap,
        width: cardWidth + (cards.length - 1) * horizontalOffset,
        child: Stack(
          children: cards.asMap().entries.map((entry) {
            int index = entry.key;
            String card = entry.value;
            final double offsetY = index * verticalOverlap;
            final double offsetX = index * horizontalOffset;

            return Positioned(
              bottom: offsetY,
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
