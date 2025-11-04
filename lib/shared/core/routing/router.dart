import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app_bloc/modules/home/home_bloc.dart';
import 'package:meal_app_bloc/modules/home/home_screen.dart';
import 'package:meal_app_bloc/modules/recipe/recipe_bloc.dart';
import 'package:meal_app_bloc/modules/recipe/recipe_screen.dart';
import 'package:meal_app_bloc/modules/search/search_bloc.dart';
import 'package:meal_app_bloc/modules/search/search_screen.dart';
import 'package:meal_app_bloc/shared/core/di/injector.dart';

final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/search',
      builder: (context, state) => BlocProvider(create: (context) => injector<SearchBloc>(), child: const SearchScreen()),
    ),
    GoRoute(
      path: '/recipe/:id',
      builder: (context, state) {
        final recipeId = state.pathParameters['id'];
        return BlocProvider(
          create: (context) => injector<RecipeBloc>(),
          child: RecipeScreen(recipeId: recipeId!),
        );
      },
    ),
  ],
);

get router => _router;
