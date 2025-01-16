import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const NavScreen({super.key, required this.navigationShell});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.navigationShell.currentIndex,
        onTap: (value) {
          widget.navigationShell.goBranch(value);
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
