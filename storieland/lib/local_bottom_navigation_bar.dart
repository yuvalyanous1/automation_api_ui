import 'package:flutter/material.dart';
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
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.1)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTab('Privacy Policy', () {
              launch(
                  'https://doc-hosting.flycricket.io/storieland-privacy-policy/c066ef4d-3df8-4560-9d41-935662fe0bac/privacy');
            }),
            _buildTab('Terms & Conditions', () {
              launch(
                  'https://doc-hosting.flycricket.io/storieland-terms-conditions/9b8ede84-57e2-46d0-9dad-2e55f2e8d043/terms');
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label, Function onTap) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
