import 'package:flutter/material.dart';

class InstagramBottomNavigationBar extends StatelessWidget {
  const InstagramBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 4,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.video_collection_outlined), label: ''),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/instagram/lolitowasap.jpeg"),
          ),
          label: '',
        ),
      ],
      unselectedItemColor: Colors.black,
    );
  }
}
