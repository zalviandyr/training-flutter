import 'package:flutter/material.dart';

class App {
  static App? _app;

  App._();

  static App get instance => _app ??= App._();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
}
