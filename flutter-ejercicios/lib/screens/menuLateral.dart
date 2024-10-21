import 'package:flutter/material.dart';
import 'package:relacion1/screens/instagram.dart';
import 'enlace.dart';
import 'enlace2.dart';


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
          Ink(
            color: Colors.indigo,
            child: ListTile(
              title: const Text(
                "Enlace 1",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const Enlace1()));
              },
            ),
          ),
          ListTile(
            title: const Text("Enlace2"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Enlace2()));
            },
          ),
          ListTile(
            title: const Text("Enlace3"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Enlace2()));
            },
          ),
          ListTile(
            title: const Text("Enlace4"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Enlace2()));
            },
          ),
          ListTile(
            title: const Text("Enlace5"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Enlace2()));
            },
          ),
            ListTile(
            title: const Text("Instagram"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const InstagramProfile()));
            },
          ),
        ],
      ),
    );
  }
}
