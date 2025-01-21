import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:redin_app/logic/roulette_logic.dart';
import 'package:redin_app/ui/widgets/roulettebuttons.dart';
import 'package:redin_app/ui/widgets/number_grid.dart';
import 'package:redin_app/ui/widgets/yellowbutton.dart';

class RouletteScreen extends HookWidget {
  const RouletteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rotation = useState(0.0);
    final isSpinning = useState(false);
    final resultNumber = useState("");
    final currentPage = useState(1); // 1 for 1-16, 2 for 17-36
    final showGrid = useState(false); // Track grid visibility

    void spinWheel() {
      if (!isSpinning.value) {
        rotation.value = RouletteLogic.spinWheel(rotation.value);
        isSpinning.value = true;
        resultNumber.value = "";

        Future.delayed(const Duration(seconds: 6), () {
          final result = RouletteLogic.calculateResult(rotation.value);
          resultNumber.value = result;
          isSpinning.value = false;
        });
      }
    }

    void toggleGrid() {
      showGrid.value = !showGrid.value; // Toggle the grid visibility
    }

    void closeGrid() {
      showGrid.value = false; // Close the grid when clicking outside
    }

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          if (showGrid.value) {
            closeGrid();
          }
        },
        child: Stack(
          children: [
            Image.asset(
              'assets/images/home/home_background.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 150.0), // Ajusta la distancia hacia arriba
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedRotation(
                      turns: rotation.value / 360,
                      duration: const Duration(milliseconds: 6000),
                      curve: Curves.easeOut,
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/roulette/ruleta.webp'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    if (resultNumber.value.isNotEmpty)
                      Stack(
                        children: [
                          Text(
                            resultNumber.value,
                            style: TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 4
                                ..color = Colors.white,
                            ),
                          ),
                          Text(
                            resultNumber.value,
                            style: TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                              color: RouletteLogic
                                      .numberColors[resultNumber.value] ??
                                  Colors.white,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 72,
              left: 0,
              right: 0,
              child: Center(
                child: YellowButton(
                  label: 'SPIN',
                  onPressed: spinWheel, // Ejecuta la función spinWheel
                ),
              ),
            ),
            Positioned(
              bottom: 164,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: toggleGrid,
                    child: const Text('Table'),
                    
                  ),
                  const SizedBox(height: 16),
                  if (!showGrid
                      .value)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomSquareButton(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              label: 'ODD',
                              onPressed: () {
                                print('Botón odd presionado');
                              },
                            ),
                            const SizedBox(width: 8),
                            CustomSquareButton(
                              color: Colors.red,
                              label: '',
                              onPressed: () {
                                print('Botón rojo presionado');
                              },
                            ),
                            const SizedBox(width: 8),
                            CustomSquareButton(
                              color: Colors.black,
                              label: '',
                              onPressed: () {
                                print('Botón negro presionado');
                              },
                            ),
                            const SizedBox(width: 8),
                            CustomSquareButton(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              label: 'EVEN',
                              onPressed: () {
                                print('Botón Even presionado');
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomSquareButton(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              label: '1-18',
                              onPressed: () {
                                print('Botón 1-18 presionado');
                              },
                            ),
                            const SizedBox(width: 8),
                            CustomSquareButton(
                              color: Colors.green,
                              label: '0',
                              onPressed: () {
                                print('Botón 0 presionado');
                              },
                            ),
                            const SizedBox(width: 8),
                            CustomSquareButton(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              label: '19-36',
                              onPressed: () {
                                print('Botón 19-36 presionado');
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  if (showGrid.value) // Mostrar grid cuando está activo
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () => currentPage.value = 1,
                              child: const Text('1-18'),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () => currentPage.value = 2,
                              child: const Text('19-36'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 200,
                          child: NumberGrid(
                            start: currentPage.value == 1 ? 1 : 19,
                            end: currentPage.value == 1 ? 18 : 36,
                            onNumberSelected: (number) {
                              print('Número seleccionado: $number');
                            },
                            onClose:
                                closeGrid, // Close the grid when clicking outside
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
