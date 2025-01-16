import 'package:go_router/go_router.dart';
import 'package:training_2/home/screens/home_detail_screen.dart';
import 'package:training_2/home/screens/home_screen.dart';
import 'package:training_2/profile/screens/profile_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: HomeScreen.path,
    routes: [
      GoRoute(
        path: HomeScreen.path,
        name: HomeScreen.name,
        builder: (context, state) => HomeScreen(),
        routes: [
          GoRoute(
            path: HomeDetailScreen.path,
            name: HomeDetailScreen.name,
            builder: (context, state) => HomeDetailScreen(),
          ),
        ],
      ),
      GoRoute(
        path: ProfileScreen.path,
        name: ProfileScreen.name,
        builder: (context, state) => ProfileScreen(),
      ),
    ],
  );
}
