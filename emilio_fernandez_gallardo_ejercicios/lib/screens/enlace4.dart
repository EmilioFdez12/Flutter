import 'package:flutter/material.dart';
import 'package:relacion1/screens/drawer.dart'; 


class Enlace4 extends StatelessWidget {
  const Enlace4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        title: const Text("Cuarta pantalla"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.add,
            size: 50,
            color: Colors.red,
            ),
            Icon(Icons.favorite,
            size: 50,
            color: Colors.blue,
            ),
            Icon(Icons.import_contacts,
            size: 50,
            color: Colors.green,),
            Icon(Icons.info,
            size: 50,
            color: Colors.orange,),
            Icon(Icons.settings,
            size: 50,
            color:Color.fromARGB(255, 36, 36, 36)),
          ],
        ),
      ),
    );
  }
}
