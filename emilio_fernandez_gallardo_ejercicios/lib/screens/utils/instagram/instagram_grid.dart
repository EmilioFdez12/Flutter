import 'package:flutter/material.dart';

class ImageGrid extends StatelessWidget {
  final List<String> listaFotos;
  const ImageGrid({super.key, required this.listaFotos});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final publicacion = listaFotos[index];
          return GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(publicacion),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        childCount: listaFotos.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
    );
  }
}
