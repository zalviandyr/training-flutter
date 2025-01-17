import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_2/core/app/app.dart';
import 'package:training_2/home/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String path = '/login';
  static const String name = 'login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _loginAction() {
    App.instance.login('asdf1234');

    context.pushReplacementNamed(HomeScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _loginAction,
          child: Text('Login'),
        ),
      ),
    );
  }
}
