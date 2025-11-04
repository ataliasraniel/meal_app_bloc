import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app_bloc/modules/home/home_repository.dart';
import 'package:meal_app_bloc/modules/home/models/category_model.dart';
import 'package:meal_app_bloc/modules/home/models/meal_model.dart';

abstract class HomeEvent {}

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final CategoryModel _categoryModel;
  CategoryModel get category => _categoryModel;
  HomeLoaded(this._categoryModel);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

class HomeInitialFetch extends HomeEvent {}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc(this.homeRepository) : super(HomeInitial()) {
    log('HomeBloc initialized');
    on<HomeInitialFetch>((event, emit) async {
      emit(HomeLoading());
      try {
        final category = await homeRepository.fetchCategories();
        emit(HomeLoaded(category));
      } catch (e) {
        log('Error fetching meals: $e');
        emit(HomeError(e.toString()));
      }
    });
  }
}
