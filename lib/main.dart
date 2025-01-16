import 'package:flutter/material.dart';
import 'package:training_2/core/app/app_route.dart';
import 'package:training_2/home/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: AppRoute.router,
    );
  }
}
