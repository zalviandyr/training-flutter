import 'package:go_router/go_router.dart';
import 'package:training_2/core/screens/nav_screen.dart';
import 'package:training_2/home/screens/home_detail_screen.dart';
import 'package:training_2/home/screens/home_screen.dart';
import 'package:training_2/profile/screens/profile_screen.dart';

class AppRoute {
  static GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return NavScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: 'home',
                builder: (context, state) => HomeScreen(),
                routes: [
                  GoRoute(
                    path: '/detail',
                    name: 'home.detail',
                    builder: (context, state) => HomeDetailScreen(),
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: 'profile',
                builder: (context, state) => ProfileScreen(),
              )
            ],
          ),
        ],
      ),

      // ShellRoute(
      //   builder: (context, state, child) {
      //     return NavScreen(child: child);
      //   },
      //   routes: [
      //     GoRoute(
      //       path: '/home',
      //       name: 'home',
      //       builder: (context, state) => HomeScreen(),
      //       routes: [
      //         GoRoute(
      //           path: '/detail',
      //           name: 'home.detail',
      //           builder: (context, state) => HomeDetailScreen(),
      //         )
      //       ],
      //     ),
      //     GoRoute(
      //       path: '/profile',
      //       name: 'profile',
      //       builder: (context, state) => ProfileScreen(),
      //     )
      //   ],
      // ),
    ],
  );
}
