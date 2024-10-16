import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Perfil de Instagram',
      home: PerfilScreen(),
    );
  }
}

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "lolitoYepa",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 2),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 24,
              color: Colors.black,
            ),
            Spacer(),
            Icon(
              Icons.menu_rounded,
              size: 32,
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Fila para la foto de perfil y los contadores
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Foto de perfil con ícono
              Stack(
                alignment: Alignment.center, // Centrar el CircleAvatar
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0), // Espaciado alrededor del avatar
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage("assets/images/lolitowasap.jpeg"),
                    ),
                  ),
                  // Ícono en la esquina inferior derecha (ajustado a la parte superior)
                  Positioned(
                    bottom: 7, // Mueve el ícono ligeramente hacia arriba
                    right: 7, // Mueve el ícono a la derecha
                    child: Container(
                      decoration:  BoxDecoration(
                        color: const Color(0xFF009cf5),
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.circle, // Forma circular
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(3.0), // Espacio alrededor del ícono
                        child: Icon(
                          Icons.add, // Cambia a tu ícono deseado
                          size: 20, // Tamaño del ícono
                          color: Colors.white, // Color del ícono
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10), // Espacio entre la foto y los contadores
              // Contadores en una fila
              const Column(
                children: [
                  Text(
                    '30',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('Publicaciones', style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(width: 10), // Espacio entre contadores
              const Column(
                children: [
                  Text(
                    '120',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('Seguidores', style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(width: 10), // Espacio entre contadores
              const Column(
                children: [
                  Text(
                    '75',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('Seguidos', style: TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),        
        ],      
      ),
    );
  }
}
