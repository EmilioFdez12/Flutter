// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:redin_app/ui/screens/blackjack_screens/blackjack_screen.dart';
import 'package:redin_app/utils/database/balance.dart';
import 'package:redin_app/ui/ui.dart';

class BlackJackBetScreen extends HookWidget {
  const BlackJackBetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final balanceProvider = Provider.of<BalanceProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    final fontSize = screenWidth * 0.12;
    final betAmount = useState(0);

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
            top: screenHeight * 0.15,
            left: screenWidth * 0.3,
            child: CoinDisplay(coins: balanceProvider.balance),
          ),
          Positioned(
            top: screenHeight * 0.28,
            left: screenWidth * 0.1,
            child: Image.asset("assets/images/blackjack/blackjack_title.webp",
            width: screenWidth * 0.8),
          ),
          Positioned(
            top: screenHeight * 0.5,
            left: 0,
            right: 0,
            child: Center(
              child: Stack(
                children: [
                  // Texto con borde (Outline)
                  Text(
                    "PLACE\nYOUR BET",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 4
                          ..color = Colors.white, // Color del borde
                      ),
                    ),
                  ),
                  // Texto principal (Relleno)
                  Text(
                    "PLACE\nYOUR BET",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: const Color.fromARGB(
                            255, 225, 0, 0), // Color de relleno
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.7,
            left: 0,
            right: 0,
            child: Center(
              child: CoinSelector(
                coinValue: betAmount.value,
                onCoinChanged: (newValue) {
                  betAmount.value = newValue;
                },
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.82,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () async {
                  if (betAmount.value > 0 &&
                      betAmount.value <= balanceProvider.balance) {
                    await balanceProvider.subtractCoins(betAmount.value);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BlackJackScreen(initialBet: betAmount.value),
                      ),
                    );
                  } else {
                    // Mostrar un mensaje de error si la apuesta no es válida
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Apuesta no válida'),
                      ),
                    );
                  }
                },
                child: Image.asset(
                  'assets/images/blackjack/table/start_button.webp', // Ruta de la imagen
                  width: screenWidth * 0.8, // Ancho de la imagen
                  height: screenHeight * 0.1, // Alto de la imagen
                  fit: BoxFit.contain, // Ajustar la imagen
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
