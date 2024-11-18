import 'package:flutter/material.dart';

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
            accountName: Text("Emilio Fernández Gallardo"),
            accountEmail: Text("micorreo@gmail.com"),
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
                color: currentRoute == '/enlace1' ? Colors.white : null, // Texto en blanco cuando está seleccionado
              ),
            ),
            selected: currentRoute == '/enlace1',  // Compara la ruta actual
            selectedTileColor: Colors.blue[300],   // Color del fondo cuando está seleccionado
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/enlace1');
            },
          ),
          ListTile(
            title: Text(
              "Enlace 2",
              style: TextStyle(
                color: currentRoute == '/enlace2' ? Colors.white : null, // Texto en blanco cuando está seleccionado
              ),
            ),
            selected: currentRoute == '/enlace2',  // Compara la ruta actual
            selectedTileColor: Colors.blue[300],   // Color del fondo cuando está seleccionado
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/enlace2');
            },
          ),
          ListTile(
            title: Text(
              "Enlace 3",
              style: TextStyle(
                color: currentRoute == '/enlace3' ? Colors.white : null, // Texto en blanco cuando está seleccionado
              ),
            ),
            selected: currentRoute == '/enlace3',  // Compara la ruta actual
            selectedTileColor: Colors.blue[300],   // Color del fondo cuando está seleccionado
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/enlace3');
            },
          ),
          ListTile(
            title: Text(
              "Enlace 4",
              style: TextStyle(
                color: currentRoute == '/enlace4' ? Colors.white : null, // Texto en blanco cuando está seleccionado
              ),
            ),
            selected: currentRoute == '/enlace4',  // Compara la ruta actual
            selectedTileColor: Colors.blue[300],   // Color del fondo cuando está seleccionado
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/enlace4');
            },
          ),
          ListTile(
            title: Text(
              "Clicker",
              style: TextStyle(
                color: currentRoute == '/contador' ? Colors.white : null, // Texto en blanco cuando está seleccionado
              ),
            ),
            selected: currentRoute == '/contador',  // Compara la ruta actual
            selectedTileColor: Colors.blue[300],   // Color del fondo cuando está seleccionado
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/contador');
            },
          ),
          ListTile(
            title: Text(
              "Instagram",
              style: TextStyle(
                color: currentRoute == '/instagram' ? Colors.white : null, // Texto en blanco cuando está seleccionado
              ),
            ),
            selected: currentRoute == '/instagram',  // Compara la ruta actual
            selectedTileColor: Colors.blue[300],   // Color del fondo cuando está seleccionado
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/instagram');
            },
          ),
          ListTile(
            title: Text(
              "Juego Clicks",
              style: TextStyle(
                color: currentRoute == '/juegoClicks' ? Colors.white : null, // Texto en blanco cuando está seleccionado
              ),
            ),
            selected: currentRoute == '/juegoClicks',  // Compara la ruta actual
            selectedTileColor: Colors.blue[300],   // Color del fondo cuando está seleccionado
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
