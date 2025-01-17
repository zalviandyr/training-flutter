import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_2/core/app/app.dart';
import 'package:training_2/core/app/app_bloc_observer.dart';
import 'package:training_2/core/app/app_router.dart';
import 'package:training_2/profile/blocs/profile_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();

  await App.instance.init();

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
      routerConfig: AppRouter.router,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => ProfileBloc(),
          child: child,
        );
      },
    );
  }
}
