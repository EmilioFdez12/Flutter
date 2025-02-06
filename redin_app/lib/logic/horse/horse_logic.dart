import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Importa fluttertoast
import 'package:redin_app/utils/database/balance.dart';
import 'package:redin_app/utils/music/music_manager.dart';

class HorseRaceLogic {
  final BuildContext context;
  final BalanceProvider balanceProvider;
  final ValueNotifier<double> horse1Position;
  final ValueNotifier<double> horse2Position;
  final ValueNotifier<double> horse3Position;
  final ValueNotifier<double> horse4Position;
  final ValueNotifier<int> coinValue;
  final ValueNotifier<String?> selectedHorse;
  final ValueNotifier<String?> winningHorse;
  final ValueNotifier<bool> isRaceRunning;
  final AudioManager audioManager; // Añadir AudioManager

  HorseRaceLogic({
    required this.context,
    required this.balanceProvider,
    required this.horse1Position,
    required this.horse2Position,
    required this.horse3Position,
    required this.horse4Position,
    required this.coinValue,
    required this.selectedHorse,
    required this.winningHorse,
    required this.isRaceRunning,
    required this.audioManager, // Inyectar AudioManager
  });

  void onCoinChanged(int value) {
    coinValue.value = value;
    print('Monedas seleccionadas: $value');
  }

  void startRace() async {
    if (selectedHorse.value == null || coinValue.value == 0) {
      Fluttertoast.showToast(
        msg: 'Por favor, selecciona un caballo y ajusta tu apuesta.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }

    if (balanceProvider.balance < coinValue.value) {
      Fluttertoast.showToast(
        msg: 'Saldo insuficiente.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }

    balanceProvider.subtractCoins(coinValue.value);

    horse1Position.value = 0;
    horse2Position.value = 0;
    horse3Position.value = 0;
    horse4Position.value = 0;

    isRaceRunning.value = true;

    // Bajar el volumen de la música de fondo a 0
    print('Muting background music');
    await audioManager.muteBackgroundMusic();

    // Reproducir la música de la carrera
    print('Playing race music');
    await audioManager.playHorseMusic();

    Timer? raceTimer;

    raceTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      final random = Random();

      horse1Position.value += 5 + random.nextInt(26);
      horse2Position.value += 5 + random.nextInt(26);
      horse3Position.value += 5 + random.nextInt(26);
      horse4Position.value += 5 + random.nextInt(26);

      if (horse1Position.value >= 275 ||
          horse2Position.value >= 275 ||
          horse3Position.value >= 275 ||
          horse4Position.value >= 275) {
        print('Race finished');
        timer.cancel();
        isRaceRunning.value = false;

        final positions = [
          horse1Position.value,
          horse2Position.value,
          horse3Position.value,
          horse4Position.value,
        ];
        final maxPosition = positions.reduce(max);
        final winningHorseIndex = positions.indexOf(maxPosition);

        winningHorse.value =
            ['Rojo', 'Verde', 'Azul', 'Amarillo'][winningHorseIndex];

        Fluttertoast.showToast(
          msg: '¡El caballo ${winningHorse.value} ha ganado!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          textColor: const Color.fromARGB(255, 12, 12, 12),
        );

        if (selectedHorse.value == winningHorse.value) {
          final reward = coinValue.value * 2;
          balanceProvider.addCoins(reward);

          Fluttertoast.showToast(
            msg: '¡Ganaste $reward monedas!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
        } else {
          await audioManager.playFailSound();
          Fluttertoast.showToast(
            msg: 'No has ganado esta vez. ¡Suerte para la próxima!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }

        // Detener la música de la carrera
        print('Stopping race music');
        await audioManager.stopHorseMusic();

        // Restaurar el volumen de la música de fondo
        print('Unmuting background music');
        await audioManager.unmuteBackgroundMusic();
      }
    });
  }
}