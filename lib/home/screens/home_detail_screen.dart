import 'package:flutter/material.dart';
import 'package:training_2/home/data/input_data.dart';

class HomeDetailExtra {
  final InputData data;

  HomeDetailExtra({required this.data});
}

class HomeDetailScreen extends StatefulWidget {
  static const String path = '/detail';
  static const String name = 'home.detail';
  final HomeDetailExtra extra;

  const HomeDetailScreen({super.key, required this.extra});

  @override
  State<HomeDetailScreen> createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Nama saya ${widget.extra.data.name}",
            ),
            Text(
              "Email saya ${widget.extra.data.email}",
            ),
            if (widget.extra.data.isSwitched) Text('Switch Hidup'),
          ],
        ),
      ),
    );
  }
}
