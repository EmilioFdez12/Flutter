// roulette_game_logic.dart
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:redin_app/logic/roulette/roulette_logic.dart';
import 'package:redin_app/utils/database/balance.dart';
import 'package:redin_app/utils/music/music_manager.dart';

class RouletteGameLogic {
  final ValueNotifier<double> rotation;
  final ValueNotifier<bool> isSpinning;
  final ValueNotifier<String> resultNumber;
  final ValueNotifier<int> coinValue;
  final ValueNotifier<String?> selectedBet;
  final ValueNotifier<Set<int>> selectedNumbers;
  final BalanceProvider balanceProvider;
  final AudioManager audioManager;

  RouletteGameLogic({
    required this.rotation,
    required this.isSpinning,
    required this.resultNumber,
    required this.coinValue,
    required this.selectedBet,
    required this.selectedNumbers,
    required this.balanceProvider,
    required this.audioManager,
  });

  void spinWheel() {
    // Verificamos si el usuario tiene suficiente saldo
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

    if (!isSpinning.value && (selectedBet.value != null || selectedNumbers.value.isNotEmpty) && coinValue.value > 0) {
      // Restamos las monedas apostadas
      balanceProvider.subtractCoins(coinValue.value);

      rotation.value = RouletteLogic.spinWheel(rotation.value);
      isSpinning.value = true;
      resultNumber.value = "";

      Future.delayed(const Duration(seconds: 6), () {
        final result = RouletteLogic.calculateResult(rotation.value);
        resultNumber.value = result;
        isSpinning.value = false;

        // Verificar si el usuario ganó
        final number = int.tryParse(result) ?? 0;

        bool isWin = false;

        // Verificar si el número está en los seleccionados
        if (selectedNumbers.value.isNotEmpty) {
          isWin = selectedNumbers.value.contains(number);
        } else {
          final color = RouletteLogic.numberColors[result];
          switch (selectedBet.value) {
            case 'ODD':
              isWin = number % 2 != 0 && number != 0;
              break;
            case 'EVEN':
              isWin = number % 2 == 0 && number != 0;
              break;
            case 'RED':
              isWin = color == RouletteLogic.rojo;
              break;
            case 'BLACK':
              isWin = color == RouletteLogic.negro;
              break;
            case 'GREEN':
              isWin = number == 0;
              break;
            case '1-18':
              isWin = number >= 1 && number <= 18;
              break;
            case '19-36':
              isWin = number >= 19 && number <= 36;
              break;
            default:
              isWin = false;
          }
        }

        if (isWin) {
          // Calculamos las ganancias
          final winnings = selectedNumbers.value.isNotEmpty
              ? coinValue.value * (36 ~/ selectedNumbers.value.length) // Pago proporcional
              : selectedBet.value == 'GREEN'
                  ? coinValue.value * 35 
                  : coinValue.value * 2;

          balanceProvider.addCoins(winnings);

          audioManager.playVictorySound();
          Fluttertoast.showToast(
            msg: "¡Ganaste! Ganancias: $winnings monedas",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
          print('¡Ganaste! Número: $number. Ganancias: $winnings');
        } else {
          Fluttertoast.showToast(
            msg: "Perdiste. Número: $number",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
          print('Perdiste. Número: $number');
        }

        // Reiniciamos la apuesta
        selectedBet.value = null;
        selectedNumbers.value = {};
      });
    } else {
      Fluttertoast.showToast(
        msg: "Selecciona un tipo de apuesta o números y una cantidad de monedas",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
      );
    }
  }
}