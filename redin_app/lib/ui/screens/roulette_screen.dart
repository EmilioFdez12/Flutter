import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:redin_app/logic/roulette_logic.dart';

class RouletteScreen extends HookWidget {
  const RouletteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rotation = useState(0.0);
    final isSpinning = useState(false);
    final resultNumber = useState("");

    void spinWheel() {
      if (!isSpinning.value) {
        rotation.value = RouletteLogic.spinWheel(rotation.value);
        isSpinning.value = true;
        resultNumber.value = ""; // Clear the result before spinning

        Future.delayed(const Duration(seconds: 6), () {
          final result = RouletteLogic.calculateResult(rotation.value);
          resultNumber.value = result;
          isSpinning.value = false;
        });
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/images/home/home_background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Wheel container
                AnimatedRotation(
                  turns: rotation.value / 360,
                  duration: const Duration(milliseconds: 6000), // Match with delay in spinWheel
                  curve: Curves.easeOut,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/roulette/ruleta.webp'),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Result text with color or square
                resultNumber.value.isNotEmpty 
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          color: RouletteLogic.numberColors[resultNumber.value],
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Número: ${resultNumber.value}',
                          style: TextStyle(
                            fontSize: 24,
                            color: RouletteLogic.numberColors[resultNumber.value] ?? Colors.white,
                          ),
                        ),
                      ],
                    )
                  : const Text(
                      'Número:',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),

                const SizedBox(height: 16),

                // Spin button
                ElevatedButton(
                  onPressed: isSpinning.value ? null : spinWheel,
                  child: const Text('¡Girar!'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}