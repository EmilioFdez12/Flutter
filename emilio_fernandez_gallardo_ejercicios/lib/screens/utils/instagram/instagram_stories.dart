import 'package:flutter/material.dart';
import 'package:relacion1/screens/utils/instagram/boton_historia.dart';

class StoryButtonList extends StatelessWidget {
  const StoryButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            BotonHistoria(imagePath: "assets/images/instagram/suma.jpg", title: "Nuevo"),
            SizedBox(width: 10),
            BotonHistoria(imagePath: "assets/images/instagram/beso.webp", title: "💜"),
            SizedBox(width: 10),
            BotonHistoria(imagePath: "assets/images/instagram/toro.png", title: "🇪🇸"),
            SizedBox(width: 10),
            BotonHistoria(imagePath: "assets/images/instagram/coliseo.png", title: "🇮🇹🍕"),
            SizedBox(width: 10),
            BotonHistoria(imagePath: "assets/images/instagram/lolitoAmigos.jpg", title: "Amigos🗣️"),
            SizedBox(width: 10),
            BotonHistoria(imagePath: "assets/images/instagram/trabajo.webp", title: "Trabajo💻"),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
