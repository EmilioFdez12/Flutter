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
    final selectedBet = useState(0); // Usamos useState para manejar el estado de la apuesta
    final balanceProvider = Provider.of<BalanceProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    final fontSize = screenWidth * 0.12;

    void startGame(BuildContext context) {
      if (selectedBet.value > 0) {
        if (balanceProvider.balance >= selectedBet.value) {
          balanceProvider.subtractCoins(selectedBet.value);
          Navigator.push(
            context,
            AnimatedRoute(page: BlackJackScreen(initialBet: selectedBet.value)),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("No tienes suficientes monedas para esta apuesta."),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Por favor, selecciona una apuesta."),
            backgroundColor: Colors.red,
          ),
        );
      }
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
            top: screenHeight * 0.15,
            left: screenWidth * 0.3,
            child: CoinDisplay(coins: balanceProvider.balance),
          ),
          Positioned(
            top: screenHeight * 0.3,
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
                        color: const Color.fromARGB(255, 225, 0, 0), // Color de relleno
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
            bottom: screenHeight * 0.25,
            left: 0,
            right: 0,
            child: Center(
              child: CoinSelector(
                coinValue: selectedBet.value,
                onCoinChanged: (value) {
                  selectedBet.value = value; // Actualizamos el valor de la apuesta
                },
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.62,
            left: screenWidth * 0.25,
            child: GestureDetector(
              onTap: () => startGame(context),
              child: Image.asset(
                'assets/images/blackjack/table/start_button.webp',
                fit: BoxFit.contain,
                width: screenWidth * 0.5,
                height: screenHeight * 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}