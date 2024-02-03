import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: GNav(
          gap: 8,
          activeColor: Colors.blue,
          color: Colors.grey,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          duration: Duration(milliseconds: 800),
          tabBackgroundColor: Colors.grey[100]!,
          tabs: [
            _buildTab(Icons.privacy_tip, 'Privacy Policy', () {
              launch(
                  'https://doc-hosting.flycricket.io/storieland-privacy-policy/c066ef4d-3df8-4560-9d41-935662fe0bac/privacy');
            }),
            _buildTab(Icons.description, 'Terms & Conditions', () {
              launch(
                  'https://doc-hosting.flycricket.io/storieland-terms-conditions/9b8ede84-57e2-46d0-9dad-2e55f2e8d043/terms');
            }),
          ],
          selectedIndex: widget.currentIndex,
          onTabChange: (index) {
            if (index == widget.currentIndex) {
              print('Already on the selected page.');
            } else {
              widget.onItemSelected(index);
            }
          },
        ),
      ),
    );
  }

  GButton _buildTab(IconData icon, String label, Function onTap) {
    return GButton(
      icon: icon,
      text: label,
      onPressed: onTap,
    );
  }
}
