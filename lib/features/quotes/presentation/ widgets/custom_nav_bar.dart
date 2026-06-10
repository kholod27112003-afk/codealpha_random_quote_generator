import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0F172A), // dark background
        border: Border(
          top: BorderSide(color: Colors.white10),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,

        backgroundColor: Colors.transparent,
        elevation: 0,

        selectedItemColor: Colors.purpleAccent,
        unselectedItemColor: Colors.white54,

        selectedFontSize: 12,
        unselectedFontSize: 11,

        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote),
            label: "Quotes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}