import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_app_bloc/modules/home/home_bloc.dart';
import 'package:meal_app_bloc/modules/home/home_repository.dart';
import 'package:meal_app_bloc/modules/home/home_screen.dart';
import 'package:meal_app_bloc/shared/core/di/injector.dart';
import 'package:meal_app_bloc/shared/core/routing/router.dart';

void main() {
  setupDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomeBloc(GetIt.instance<HomeRepository>()))],
      child: MaterialApp.router(title: 'Meal App Bloc', routerConfig: router),
    );
  }
}
