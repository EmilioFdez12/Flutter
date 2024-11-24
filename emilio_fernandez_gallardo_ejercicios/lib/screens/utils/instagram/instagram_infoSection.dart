import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: CircleAvatar(
                radius: 45,
                backgroundImage:
                    AssetImage("assets/images/instagram/lolitowasap.jpeg"),
              ),
            ),
            Positioned(
              bottom: 7,
              right: 7,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF009cf5),
                  border: Border.all(color: Colors.white, width: 2),
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.add,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 15),
        const Column(
          children: [
            Text(
              '30',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Publicaciones', style: TextStyle(fontSize: 14)),
          ],
        ),
        const SizedBox(width: 10),
        const Column(
          children: [
            Text(
              '120',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Seguidores', style: TextStyle(fontSize: 14)),
          ],
        ),
        const SizedBox(width: 10),
        const Column(
          children: [
            Text(
              '75',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Seguidos', style: TextStyle(fontSize: 14)),
          ],
        ),
      ],
    );
  }
}
