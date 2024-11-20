import 'package:flutter/material.dart';
import 'package:relacion1/screens/screens.dart';

class Instagram extends StatefulWidget {
  const Instagram({super.key});

  @override
  _InstagramState createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> listaFotosPerfil = [
    "assets/images/instagram/lolitoAmigos.jpg",
    "assets/images/instagram/post1.jpg",
    "assets/images/instagram/post3.png",
    "assets/images/instagram/post4.png",
    "assets/images/instagram/post5.png",
    "assets/images/instagram/post6.jpg",
    "assets/images/instagram/post7.jpg",
    "assets/images/instagram/post8.jpg",
    "assets/images/instagram/post9.jpg",
    "assets/images/instagram/post10.jpg",
  ];

  final List<String> listaFotosMenciones = [
    "assets/images/instagram/chill.png",
    "assets/images/instagram/sirmaza.png",
    "assets/images/instagram/omnitrix.png",
    "assets/images/instagram/ferra.png",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: const InstagramAppBar(),
      ),
      drawer: const MenuLateral(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const UserInfo(),
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
            const StoryButtonList(),
            const Divider(thickness: 0.5),
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(icon: Icon(Icons.grid_on, size: 25, color: Colors.black)),
                Tab(
                  icon: Transform.rotate(
                    angle: 3.14159 / 2,
                    child: Icon(
                      Icons.label_important_outline_rounded,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
              indicatorColor: Colors.black,
              indicatorPadding: EdgeInsets.symmetric(horizontal: -90.0),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  GridView.builder(
                    itemCount: listaFotosPerfil.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) {
                      final publicacion = listaFotosPerfil[index];
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
                  ),
                  GridView.builder(
                    itemCount: listaFotosMenciones.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) {
                      final publicacion = listaFotosMenciones[index];
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const InstagramBottomNavigationBar(),
    );
  }
}
