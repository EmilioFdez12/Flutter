import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Empresa"),
            accountEmail: Text("micorreo@gmail.com"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY5-Yclp9mGDw9I1oK89E0OkpD91Ci7ePTaQ&s"),
                    fit: BoxFit.fill)),
          ),
          ListTile(
            title: const Text("Enlace 1"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/enlace1');
            },
          ),
          ListTile(
            title: const Text("Enlace 2"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/enlace2');
            },
          ),
          ListTile(
            title: const Text("Enlace 3"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/enlace3');
            },
          ),
          ListTile(
            title: const Text("Enlace 4"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/enlace4');
            },
          ),
          ListTile(
            title: const Text("Clicker"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/contador');
            },
          ),
          ListTile(
            title: const Text("Instagram"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/instagram');
            },
          ),
          ListTile(
            title: const Text("Juego Clicks"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/juegoClicks');
            },
          ),
        ],
      ),
    );
  }
}
