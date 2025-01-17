import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App {
  static App? _app;

  App._();

  static App get instance => _app ??= App._();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  late SharedPreferences pref;
  late Dio client;

  Future<void> init() async {
    pref = await SharedPreferences.getInstance();
    client = _client;
  }

  Dio get _client {
    Dio client = Dio();
    client.options.baseUrl = 'https://api.themoviedb.org';
    client.options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NTkxZWI2MzUzYjVhZmM0ODJiM2NkNjVlM2U3ZmY0YiIsIm5iZiI6MTU5OTY5NjExNi4wNDE5OTk4LCJzdWIiOiI1ZjU5NmNmNDA3OWE5NzAwMzdiNGMzZTkiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.iQ8yrecD1UY_X8s_aTyRXl3utCqQ_8nApjqow4OB-ic';

    return client;
  }

  Future<void> login(String token) async {
    await pref.setString('token', token);
  }

  Future<void> logout() async {
    pref.remove('token');
  }

  String? getToken() {
    return pref.getString('token');
  }
}
