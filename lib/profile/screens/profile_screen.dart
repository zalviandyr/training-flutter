import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_2/core/widgets/button.dart';

class ProfileScreen extends StatefulWidget {
  static const String path = '/profile';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _backAction() {
    // Navigator.pop(context);

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile Screen'),
            SizedBox(height: 50),
            Button(onPressed: _backAction, label: 'Kembali'),
          ],
        ),
      ),
    );
  }
}
