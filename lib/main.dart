import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:training_2/core/app/app.dart';
import 'package:training_2/core/app/app_bloc_observer.dart';
import 'package:training_2/core/app/app_router.dart';
import 'package:training_2/core/screens/nav_screen.dart';
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
      builder: FlutterSmartDialog.init(
        builder: (context, child) {
          return BlocProvider(
            create: (context) => ProfileBloc(),
            child: child,
          );
        },
        loadingBuilder: (message) {
          return Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: LoadingAnimationWidget.inkDrop(color: Colors.blue, size: 50),
          );
        },
      ),
    );
  }
}
