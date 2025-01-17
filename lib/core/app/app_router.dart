import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:training_2/core/app/app.dart';
import 'package:training_2/home/screens/home_detail_screen.dart';
import 'package:training_2/home/screens/home_screen.dart';
import 'package:training_2/movie/blocs/movie_bloc.dart';
import 'package:training_2/movie/screens/movie_screen.dart';
import 'package:training_2/profile/screens/profile_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: App.instance.navigatorKey,
    // initialLocation: HomeScreen.path,
    initialLocation: MovieScreen.path,
    routes: [
      GoRoute(
        path: HomeScreen.path,
        name: HomeScreen.name,
        builder: (context, state) => HomeScreen(),
        routes: [
          GoRoute(
            path: HomeDetailScreen.path,
            name: HomeDetailScreen.name,
            builder: (context, state) => HomeDetailScreen(
              extra: state.extra as HomeDetailExtra,
            ),
          ),
        ],
      ),
      GoRoute(
        path: ProfileScreen.path,
        name: ProfileScreen.name,
        builder: (context, state) => ProfileScreen(),
      ),
      GoRoute(
        path: MovieScreen.path,
        name: MovieScreen.name,
        builder: (context, state) => BlocProvider(
          create: (context) => MovieBloc(),
          child: MovieScreen(),
        ),
      )
    ],
  );
}
