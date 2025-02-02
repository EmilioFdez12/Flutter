import 'package:flutter/material.dart';

class BetButtons extends StatelessWidget {


  const BetButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    final buttonWidth = screenWidth * 0.2;
    final buttonHeight = screenHeight * 0.1;
    final roundButtonSize = screenWidth * 0.15;
    final fontSize = screenWidth * 0.05;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Botón HIT
        _buildButton(
          text: "HIT",
          color: Colors.blue,
          borderColor: Colors.blue[300]!,
          width: buttonWidth * 1.2,
          height: buttonHeight * 0.6,
          isRound: false,
          fontSize: fontSize,
          onPressed: () => print('hit'),
        ),
        const SizedBox(width: 10),
        // Botón STAND
        _buildButton(
          text: "STAND",
          color: Colors.red,
          borderColor: Colors.red[300]!,
          width: buttonWidth * 1.2,
          height: buttonHeight * 0.6,
          isRound: false,
          fontSize: fontSize,
          onPressed: () => print('stand'),
        ),
      ],
    );
  }

  Widget _buildButton({
    required String text,
    required Color color,
    required Color borderColor,
    required double width,
    required double height,
    required bool isRound,
    required double fontSize,
    required VoidCallback? onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: onPressed != null ? color.withOpacity(0.2) : Colors.grey,
          borderRadius: isRound
              ? BorderRadius.circular(height / 2)
              : BorderRadius.circular(12),
          border: Border.all(
            color: onPressed != null ? borderColor : Colors.grey,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: onPressed != null ? color : Colors.grey,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}