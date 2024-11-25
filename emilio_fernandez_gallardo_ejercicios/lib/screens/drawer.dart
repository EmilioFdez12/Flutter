// menu_lateral.dart

import 'package:flutter/material.dart';
import 'package:relacion1/screens/screens.dart'; // Asegúrate de importar AppRoutes

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtén la ruta actual
    String currentRoute = ModalRoute.of(context)?.settings.name ?? '';

    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Emilio Fernández Gallardo", style: TextStyle(fontSize: 20)),
            accountEmail: Text("micorreo@gmail.com", style: TextStyle(fontSize: 18)),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY5-Yclp9mGDw9I1oK89E0OkpD91Ci7ePTaQ&s"),
                    fit: BoxFit.fill)),
          ),
          ListTile(
            title: Text(
              "Enlace 1",
              style: TextStyle(
                color: currentRoute == AppRoutes.enlace1 ? Colors.white : null,
              ),
            ),
            selected: currentRoute == AppRoutes.enlace1,
            selectedTileColor: Colors.blue[300],
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AppRoutes.enlace1);
            },
          ),
          ListTile(
            title: Text(
              "Enlace 2",
              style: TextStyle(
                color: currentRoute == AppRoutes.enlace2 ? Colors.white : null,
              ),
            ),
            selected: currentRoute == AppRoutes.enlace2,
            selectedTileColor: Colors.blue[300],
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AppRoutes.enlace2);
            },
          ),
          ListTile(
            title: Text(
              "Enlace 3",
              style: TextStyle(
                color: currentRoute == AppRoutes.enlace3 ? Colors.white : null,
              ),
            ),
            selected: currentRoute == AppRoutes.enlace3,
            selectedTileColor: Colors.blue[300],
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AppRoutes.enlace3);
            },
          ),
          ListTile(
            title: Text(
              "Enlace 4",
              style: TextStyle(
                color: currentRoute == AppRoutes.enlace4 ? Colors.white : null,
              ),
            ),
            selected: currentRoute == AppRoutes.enlace4,
            selectedTileColor: Colors.blue[300],
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AppRoutes.enlace4);
            },
          ),
          ListTile(
            title: Text(
              "Enlace 5",
              style: TextStyle(
                color: currentRoute == AppRoutes.enlace5 ? Colors.white : null,
              ),
            ),
            selected: currentRoute == AppRoutes.enlace5,
            selectedTileColor: Colors.blue[300],
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AppRoutes.enlace5);
            },
          ),
          ListTile(
            title: Text(
              "Piramide",
              style: TextStyle(
                color: currentRoute == AppRoutes.piramide ? Colors.white : null,
              ),
            ),
            selected: currentRoute == AppRoutes.piramide,
            selectedTileColor: Colors.blue[300],
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AppRoutes.piramide);
            },
          ),
          ListTile(
            title: Text(
              "Clicker",
              style: TextStyle(
                color: currentRoute == AppRoutes.clicker ? Colors.white : null,
              ),
            ),
            selected: currentRoute == AppRoutes.clicker,
            selectedTileColor: Colors.blue[300],
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AppRoutes.clicker);
            },
          ),
          ListTile(
            title: Text(
              "Instagram",
              style: TextStyle(
                color: currentRoute == AppRoutes.instagram ? Colors.white : null,
              ),
            ),
            selected: currentRoute == AppRoutes.instagram,
            selectedTileColor: Colors.blue[300],
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AppRoutes.instagram);
            },
          ),
          ListTile(
            title: Text(
              "Juego Clicks",
              style: TextStyle(
                color: currentRoute == AppRoutes.juegoClicks ? Colors.white : null,
              ),
            ),
            selected: currentRoute == AppRoutes.juegoClicks,
            selectedTileColor: Colors.blue[300],
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AppRoutes.juegoClicks);
            },
          ),
        ],
      ),
    );
  }
}
