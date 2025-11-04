import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_app_bloc/modules/home/home_repository.dart';
import 'package:meal_app_bloc/modules/recipe/recipe_bloc.dart';
import 'package:meal_app_bloc/modules/recipe/recipe_repository.dart';
import 'package:meal_app_bloc/modules/search/search_bloc.dart';
import 'package:meal_app_bloc/modules/search/search_repository.dart';
import 'package:meal_app_bloc/shared/core/client/client_api.dart';

final GetIt injector = GetIt.instance;

void setupDependencies() {
  injector.registerLazySingleton<Dio>(() => Dio());
  injector.registerLazySingleton<ClientApi>(() => ClientApi(injector<Dio>()).setup());
  injector.registerLazySingleton<HomeRepository>(() => HomeRepository(injector<ClientApi>()));
  injector.registerLazySingleton<SearchRepository>(() => SearchRepository(injector<ClientApi>()));
  injector.registerFactory<SearchBloc>(() => SearchBloc(injector<SearchRepository>()));
  injector.registerLazySingleton<RecipeRepository>(() => RecipeRepository(injector<ClientApi>()));
  injector.registerLazySingleton<RecipeBloc>(() => RecipeBloc(injector<RecipeRepository>()));
}
