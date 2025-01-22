import 'package:flutter/material.dart';

class CoinSelector extends StatelessWidget {
  final int coinValue;
  final Function(int) onCoinChanged;

  const CoinSelector({
    super.key,
    required this.coinValue,
    required this.onCoinChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Obtener el tamaño de la pantalla
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    // Ajustar el tamaño de los elementos dinámicamente
    final iconSize = screenWidth * 0.08;
    final fontSize = screenWidth * 0.06;
    final paddingHorizontal = screenWidth ;
    final paddingVertical = screenHeight;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal * 0.01,
        vertical: paddingVertical * 0.001,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Botón para restar 50
          IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: Colors.red,
              size: iconSize, // Tamaño dinámico
            ),
            onPressed: () {
              if (coinValue >= 50) {
                onCoinChanged(coinValue - 50);
              }
            },
          ),
          // Botón para restar 1
          IconButton(
            icon: Icon(
              Icons.remove,
              color: Colors.white,
              size: iconSize, // Tamaño dinámico
            ),
            onPressed: () {
              if (coinValue > 1) {
                onCoinChanged(coinValue - 1);
              }
            },
          ),
          SizedBox(width: paddingHorizontal * 0.04),
          // Valor actual
          Text(
            '$coinValue', // Solo el valor, sin "Coins"
            style: TextStyle(
              fontSize: fontSize, // Tamaño dinámico
              fontWeight: FontWeight.bold,
              color: Colors.white, // Texto blanco
            ),
          ),
          // Botón para sumar 1
          SizedBox(width: paddingHorizontal * 0.04),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: iconSize, // Tamaño dinámico
            ),
            onPressed: () {
              onCoinChanged(coinValue + 1);
            },
          ),
          // Botón para sumar 50
          IconButton(
            icon: Icon(
              Icons.chevron_right,
              color: Colors.green,
              size: iconSize, // Tamaño dinámico
            ),
            onPressed: () {
              onCoinChanged(coinValue + 50);
            },
          ),
        ],
      ),
    );
  }
}