import 'package:flutter/material.dart';
import 'package:training_2/core/app/app.dart';

showSnackbar(String message) {
  ScaffoldMessenger.of(App.instance.navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ),
  );
}
