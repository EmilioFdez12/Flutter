import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:redin_app/ui/widgets/horse/horse_button.dart';
import 'package:redin_app/ui/widgets/horse/horse_racetrack.dart';
import 'package:redin_app/utils/database/balance.dart';
import 'package:redin_app/ui/ui.dart';

class HorseScreen extends HookWidget {
  const HorseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final balanceProvider = Provider.of<BalanceProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    // Controladores de animación para cada caballo
    final animationController1 = useAnimationController(duration: const Duration(seconds: 15));
    final animationController2 = useAnimationController(duration: const Duration(seconds: 15));
    final animationController3 = useAnimationController(duration: const Duration(seconds: 15));
    final animationController4 = useAnimationController(duration: const Duration(seconds: 15));

    // Animaciones para mover los caballos
    final animation1 = Tween<double>(begin: 0, end: 275).animate(animationController1);
    final animation2 = Tween<double>(begin: 0, end: 275).animate(animationController2);
    final animation3 = Tween<double>(begin: 0, end: 275).animate(animationController3);
    final animation4 = Tween<double>(begin: 0, end: 275).animate(animationController4);

    // Estado para el valor de las monedas seleccionadas
    final coinValue = useState(0);

    // Estado para la apuesta seleccionada
    final selectedHorse = useState<String?>(null);

    // Estado para almacenar el caballo ganador
    final winningHorse = useState<String?>(null);

    // Función para manejar cambios en el valor de las monedas
    void onCoinChanged(int value) {
      coinValue.value = value;
      print('Monedas seleccionadas: $value');
    }

    // Función para iniciar la carrera
    void startRace() {
      if (selectedHorse.value == null || coinValue.value == 0) {
        // Mostramos un mensaje de error si no se ha seleccionado un caballo o no se ha apostado
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Por favor, selecciona un caballo y ajusta tu apuesta.'),
          ),
        );
        return;
      }

      // Verificamos si el saldo es suficiente
      if (balanceProvider.balance < coinValue.value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Saldo insuficiente.'),
          ),
        );
        return;
      }

      // Descontamos la apuesta del saldo
      balanceProvider.subtractCoins(coinValue.value);

      // Iniciamos la carrera
      final random = Random();

      // Asignar velocidades aleatorias a cada caballo con mayor variabilidad
      final speed1 = 10 + random.nextInt(6); // Entre 10 y 15 segundos
      final speed2 = 10 + random.nextInt(6);
      final speed3 = 10 + random.nextInt(6);
      final speed4 = 10 + random.nextInt(6);

      // Calculamos la duración de la animación en función de la velocidad
      animationController1.duration = Duration(seconds: speed1);
      animationController2.duration = Duration(seconds: speed2);
      animationController3.duration = Duration(seconds: speed3);
      animationController4.duration = Duration(seconds: speed4);

      // Reiniciamos las animaciones antes de iniciarlas
      animationController1.reset();
      animationController2.reset();
      animationController3.reset();
      animationController4.reset();

      // Iniciamos las animaciones
      animationController1.forward();
      animationController2.forward();
      animationController3.forward();
      animationController4.forward();

      // Listener para detectar cuándo un caballo ha terminado la carrera
      void checkRaceCompletion() {
        final horseSpeeds = [speed1, speed2, speed3, speed4];
        final minSpeed = horseSpeeds.reduce(min);
        final winningHorseIndex = horseSpeeds.indexOf(minSpeed);

        // Asignamos el nombre del caballo ganador
        winningHorse.value = ['Rojo', 'Verde', 'Azul', 'Amarillo'][winningHorseIndex];

        // Mostramos el resultado
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('¡El caballo ${winningHorse.value} ha ganado!'),
            
          ),
        );

        // Verificamos si el usuario apostó al caballo ganador
        if (selectedHorse.value == winningHorse.value) {
          // Calcular la recompensa (por ejemplo, 2x la apuesta)
          final reward = coinValue.value * 2;
          balanceProvider.addCoins(reward);

          // Mostrar mensaje de victoria
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('¡Ganaste $reward monedas!'),
            ),
          );
        } else {
          // Mostramos mensaje al perder
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No has ganado esta vez. ¡Suerte para la próxima!'),
            ),
          );
        }
      }

      // Esperamos a que terminen los caballos y verificamos el resultado
      Future.delayed(const Duration(seconds: 15), checkRaceCompletion);
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
            top: screenHeight * 0.08,
            left: screenWidth * 0.1,
            child: CoinDisplay(coins: balanceProvider.balance),
          ),
          // Caballo 1
          Positioned(
            top: screenHeight * 0.35,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedBuilder(
                animation: animation1,
                builder: (context, child) {
                  return HorseRaceTrack(
                    horseImagePath: 'assets/images/horse/caballo_rojo.png',
                    offset: animation1.value,
                  );
                },
              ),
            ),
          ),
          // Caballo 2
          Positioned(
            top: screenHeight * 0.40,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedBuilder(
                animation: animation2,
                builder: (context, child) {
                  return HorseRaceTrack(
                    horseImagePath: 'assets/images/horse/caballo_verde.png',
                    offset: animation2.value,
                  );
                },
              ),
            ),
          ),
          // Caballo 3
          Positioned(
            top: screenHeight * 0.45,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedBuilder(
                animation: animation3,
                builder: (context, child) {
                  return HorseRaceTrack(
                    horseImagePath: 'assets/images/horse/caballo_azul.png',
                    offset: animation3.value,
                  );
                },
              ),
            ),
          ),
          // Caballo 4
          Positioned(
            top: screenHeight * 0.50,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedBuilder(
                animation: animation4,
                builder: (context, child) {
                  return HorseRaceTrack(
                    horseImagePath: 'assets/images/horse/caballo_amarillo.png',
                    offset: animation4.value,
                  );
                },
              ),
            ),
          ),
          // Botones de apuesta
          Positioned(
            top: screenHeight * 0.6,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ColorSquareButton(
                  color: Colors.red,
                  onPressed: () {
                    selectedHorse.value = 'Rojo';
                    print('Apuesta al caballo rojo: ${coinValue.value} monedas');
                  },
                ),
                ColorSquareButton(
                  color: Colors.green,
                  onPressed: () {
                    selectedHorse.value = 'Verde';
                    print('Apuesta al caballo verde: ${coinValue.value} monedas');
                  },
                ),
                ColorSquareButton(
                  color: Colors.blue,
                  onPressed: () {
                    selectedHorse.value = 'Azul';
                    print('Apuesta al caballo azul: ${coinValue.value} monedas');
                  },
                ),
                ColorSquareButton(
                  color: Colors.yellow,
                  onPressed: () {
                    selectedHorse.value = 'Amarillo';
                    print('Apuesta al caballo amarillo: ${coinValue.value} monedas');
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.70,
            left: 0,
            right: 0,
            child: Center(
              child: CoinSelector(
                coinValue: coinValue.value,
                onCoinChanged: onCoinChanged,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.80,
            left: 0,
            right: 0,
            child: Center(
              child: SpinButton(
                label: 'GO!',
                onPressed: startRace,
              ),
            ),
          ),
        ],
      ),
    );
  }
}