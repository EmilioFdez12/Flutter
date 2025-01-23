import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:redin_app/ui/screens/menu_screen.dart';
import 'package:redin_app/utils/database/balance.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Configurar la orientación preferida a vertical
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,  
    DeviceOrientation.portraitDown,
  ]);

  // Configuracion de la barra de estado
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 12, 12, 12),
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => BalanceProvider(),
      child: const Redin(),
    ),
  );
}

class Redin extends StatelessWidget {
  const Redin({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuScreen(),
    );
  }
}