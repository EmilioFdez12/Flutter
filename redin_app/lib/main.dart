import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redin_app/ui/screens/menu_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 12, 12 ,12), 
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const Redin());
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
