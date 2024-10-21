import 'package:flutter/material.dart';
import 'package:relacion1/screens/utils/instagram_utils/boton_historia.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Perfil de Instagram',
      home: InstagramProfile(),
    );
  }
}

class InstagramProfile extends StatefulWidget {
  const InstagramProfile({super.key});

  @override
  _InstagramProfileState createState() => _InstagramProfileState();
}

// Clase privada
class _InstagramProfileState extends State<InstagramProfile> {
  @override
  Widget build(BuildContext context) {
    final List<String> listaFotos = [
      "assets/images/instagram/post1.jpg",
      "assets/images/instagram/post1.jpg",
      "assets/images/instagram/post1.jpg",
      "assets/images/instagram/post1.jpg",
      "assets/images/instagram/post1.jpg",
      "assets/images/instagram/post1.jpg",
      "assets/images/instagram/post1.jpg",
      "assets/images/instagram/post1.jpg",
      "assets/images/instagram/post1.jpg",
      "assets/images/instagram/post1.jpg",
      "assets/images/instagram/post1.jpg",
      "assets/images/instagram/post1.jpg",
    ];

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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
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
                                AssetImage("assets/images/lolitowasap.jpeg"),
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
                    const SizedBox(width: 10),
                    const Column(
                      children: [
                        Text(
                          '30',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text('Publicaciones', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      children: [
                        Text(
                          '120',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text('Seguidores', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      children: [
                        Text(
                          '75',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text('Seguidos', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(
                      'Manuel Fernández Torres',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(
                      'YEPA (Ya estoy por aquí)',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white60,
                        side: const BorderSide(
                            color: Color.fromARGB(255, 201, 201, 201),
                            width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        'Editar perfil',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        BotonHistoria(
                            imagePath: "assets/images/suma.jpg", title: "Nuevo"),
                        SizedBox(width: 10),
                        BotonHistoria(
                            imagePath: "assets/images/beso.webp", title: "💜"),
                        SizedBox(width: 10),
                        BotonHistoria(
                            imagePath: "assets/images/story2.jpeg", title: "🇪🇸"),
                        SizedBox(width: 10),
                        BotonHistoria(
                            imagePath: "assets/images/story2.jpeg", title: "🇮🇹🍕"),
                        SizedBox(width: 10),
                        BotonHistoria(
                            imagePath: "assets/images/story4.jpeg",
                            title: "Amigos🗣️"),
                        SizedBox(width: 10),
                        BotonHistoria(
                            imagePath: "assets/images/story6.jpeg",
                            title: "Trabajo💻"),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final publicacion = listaFotos[index];
                return GestureDetector(
                  onTap: () {
                    // Acción al hacer tap
                  },
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
          ),
        ],
      ),
bottomNavigationBar: BottomNavigationBar(
  currentIndex: 4, // El índice 4 representa el ítem del perfil
  showSelectedLabels: false,
  showUnselectedLabels: false,
  type: BottomNavigationBarType.fixed,
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search_outlined),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_box_outlined),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.video_collection_outlined),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: CircleAvatar(
        radius: 15,
        backgroundImage: AssetImage("assets/images/lolitowasap.jpeg"),
      ),
      activeIcon: CircleAvatar(
        radius: 15,
        backgroundImage: AssetImage("assets/images/lolitowasap.jpeg"),
        backgroundColor: Colors.black, // Indicador cuando está activo
      ),
      label: '',
    ),
  ],
  unselectedItemColor: Colors.black,
),
    );
  }
}
