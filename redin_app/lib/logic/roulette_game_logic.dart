// roulette_game_logic.dart
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:redin_app/logic/roulette_logic.dart';
import 'package:redin_app/utils/database/balance.dart';
import 'package:redin_app/utils/music/music_manager.dart';

class RouletteGameLogic {
  final ValueNotifier<double> rotation;
  final ValueNotifier<bool> isSpinning;
  final ValueNotifier<String> resultNumber;
  final ValueNotifier<int> coinValue;
  final ValueNotifier<String?> selectedBet;
  final BalanceProvider balanceProvider;
  final AudioManager audioManager;

  RouletteGameLogic({
    required this.rotation,
    required this.isSpinning,
    required this.resultNumber,
    required this.coinValue,
    required this.selectedBet,
    required this.balanceProvider,
    required this.audioManager,
  });

  void spinWheel() {
    // Verificar si el usuario tiene suficiente saldo
    if (coinValue.value > balanceProvider.balance) {
      Fluttertoast.showToast(
        msg: "No tienes suficientes monedas para apostar",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }

    if (!isSpinning.value && selectedBet.value != null && coinValue.value > 0) {
      // Restar las monedas apostadas
      balanceProvider.subtractCoins(coinValue.value);

      rotation.value = RouletteLogic.spinWheel(rotation.value);
      isSpinning.value = true;
      resultNumber.value = "";

      Future.delayed(const Duration(seconds: 6), () {
        final result = RouletteLogic.calculateResult(rotation.value);
        resultNumber.value = result;
        isSpinning.value = false;

        // Verificar si el usuario ganó
        final number = int.tryParse(result) ?? 0; // Convertir el resultado a número
        final color = RouletteLogic.numberColors[result]; // Color del número

        bool isWin = false;

        switch (selectedBet.value) {
          case 'ODD':
            isWin = number % 2 != 0 && number != 0; // Números impares (excepto 0)
            break;
          case 'EVEN':
            isWin = number % 2 == 0 && number != 0; // Números pares (excepto 0)
            break;
          case 'RED':
            isWin = color == RouletteLogic.rojo; // Números rojos
            break;
          case 'BLACK':
            isWin = color == RouletteLogic.negro; // Números negros
            break;
          case 'GREEN':
            isWin = number == 0; // Solo el número 0
            break;
          case '1-18':
            isWin = number >= 1 && number <= 18; // Números del 1 al 18
            break;
          case '19-36':
            isWin = number >= 19 && number <= 36; // Números del 19 al 36
            break;
          default:
            isWin = false;
        }

        if (isWin) {
          // Calcular las ganancias según el tipo de apuesta
          final winnings = selectedBet.value == 'GREEN'
              ? coinValue.value * 35 // Paga 35:1 si es GREEN
              : coinValue.value * 2; // Paga 2:1 para otras apuestas

          balanceProvider.addCoins(winnings);

          audioManager.playVictorySound();
          // Mostrar mensaje de victoria
          Fluttertoast.showToast(
            msg: "¡Ganaste! Ganancias: $winnings monedas",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
          print('¡Ganaste! Número: $number. Ganancias: $winnings');
        } else {
          // Mostrar mensaje de derrota
          Fluttertoast.showToast(
            msg: "Perdiste. Número: $number",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
          print('Perdiste. Número: $number');
        }

        // Reiniciar la apuesta
        selectedBet.value = null;
      });
    } else {
      Fluttertoast.showToast(
        msg: "Selecciona un tipo de apuesta y una cantidad de monedas",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
      );
    }
  }
}