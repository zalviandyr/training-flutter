import 'package:flutter/material.dart';

class HomeDetailScreen extends StatefulWidget {
  static const String path = '/detail';
  static const String name = 'home.detail';

  const HomeDetailScreen({super.key});

  @override
  State<HomeDetailScreen> createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home Detail Screen'),
      ),
    );
  }
}
