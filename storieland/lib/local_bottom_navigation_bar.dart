import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'homepage.dart';
import 'video_player_page.dart';

class LocalBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const LocalBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  _LocalBottomNavigationBarState createState() =>
      _LocalBottomNavigationBarState();
}

class _LocalBottomNavigationBarState extends State<LocalBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(0, 248, 248, 250),
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: widget.currentIndex,
      onTap: (index) {
        widget.onItemSelected(index);

        if (index == 1) {
          // Privacy Policy
          launch(
              'https://doc-hosting.flycricket.io/storieland-privacy-policy/c066ef4d-3df8-4560-9d41-935662fe0bac/privacy');
        } else if (index == 2) {
          // Terms & Conditions
          launch(
              'https://doc-hosting.flycricket.io/storieland-terms-conditions/9b8ede84-57e2-46d0-9dad-2e55f2e8d043/terms');
        } else if (index == 0) {
          // Home
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Bookstore()),
          );
        } else if (index == 3) {
          // Video
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => VideoPlayrePage()),
          );
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: widget.currentIndex == 0 ? Colors.blue : Colors.grey,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.privacy_tip),
          label: 'Privacy Policy',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description),
          label: 'Terms & Conditions',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.video_call,
            color: widget.currentIndex == 3 ? Colors.blue : Colors.grey,
          ),
          label: 'Video',
        ),
      ],
    );
  }
}
