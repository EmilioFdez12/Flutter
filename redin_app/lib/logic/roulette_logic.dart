import 'dart:math';
import 'package:flutter/material.dart';

class RouletteLogic {
  static const List<String> numbers = [
    "0", "32", "15", "19", "4", "21", "2", "25", "17", "34", "6",
    "27", "13", "36", "11", "30", "8", "23", "10", "5", "24", "16",
    "33", "1", "20", "14", "31", "9", "22", "18", "29", "7", "28", "12", "35", "3", "26"
  ];

  static const Map<String, Color> numberColors = {
    '0': Colors.green,
    '1': Colors.red, '3': Colors.red, '5': Colors.red, '7': Colors.red, '9': Colors.red,
    '12': Colors.red, '14': Colors.red, '16': Colors.red, '18': Colors.red, '19': Colors.red,
    '21': Colors.red, '23': Colors.red, '25': Colors.red, '27': Colors.red, '30': Colors.red,
    '32': Colors.red, '34': Colors.red, '36': Colors.red,
    '2': Colors.black, '4': Colors.black, '6': Colors.black, '8': Colors.black,
    '10': Colors.black, '11': Colors.black, '13': Colors.black, '15': Colors.black,
    '17': Colors.black, '20': Colors.black, '22': Colors.black, '24': Colors.black,
    '26': Colors.black, '28': Colors.black, '29': Colors.black, '31': Colors.black,
    '33': Colors.black, '35': Colors.black,
  };

  static final double sectorAngle = 360.0 / numbers.length;

  /// Genera la rotación total incluyendo giros completos y un extra aleatorio
  static double spinWheel(double currentRotation) {
    final randomExtraRotation = Random().nextInt(360);
    return currentRotation + 1440 + randomExtraRotation; // Giros completos + aleatorio
  }

  /// Calcula el número resultante basado en el ángulo final
  static String calculateResult(double finalRotation) {
    // Normaliza el ángulo a un rango de 0-360
    final normalizedAngle = finalRotation % 360.0;

    // Ajusta para que el 0 esté en la parte superior
    final adjustedAngle = (360.0 - normalizedAngle) % 360.0;

    // Calcula el índice del sector basado en el ángulo ajustado
    final index = ((adjustedAngle + sectorAngle / 2) / sectorAngle).floor() % numbers.length;

    // Devuelve el número correspondiente
    return numbers[index];
  }
}
