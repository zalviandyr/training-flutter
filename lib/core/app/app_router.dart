import 'package:go_router/go_router.dart';
import 'package:training_2/home/screens/home_screen.dart';
import 'package:training_2/profile/screens/profile_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: HomeScreen.path,
    routes: [
      GoRoute(
        path: HomeScreen.path,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: ProfileScreen.path,
        builder: (context, state) => ProfileScreen(),
      ),
    ],
  );
}
