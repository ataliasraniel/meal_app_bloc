import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app_bloc/modules/search/models/meal_search_model.dart';
import 'package:meal_app_bloc/modules/search/search_repository.dart';

abstract class SearchEvent {}

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final MealSearchModel meals;
  SearchLoaded(this.meals);
}

class SearchEmpty extends SearchState {}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}

class SearchMeals extends SearchEvent {
  final String query;
  SearchMeals(this.query);
}

class SearchClear extends SearchEvent {}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository searchRepository;

  SearchBloc(this.searchRepository) : super(SearchInitial()) {
    on<SearchMeals>((event, emit) async {
      if (event.query.isEmpty) {
        emit(SearchInitial());
        return;
      }

      emit(SearchLoading());
      try {
        final meals = await searchRepository.searchMealsByName(event.query);
        if (meals.meals == null || meals.meals!.isEmpty) {
          emit(SearchEmpty());
        } else {
          emit(SearchLoaded(meals));
        }
      } catch (e) {
        log('Error searching meals: $e');
        emit(SearchError(e.toString()));
      }
    });

    on<SearchClear>((event, emit) {
      emit(SearchInitial());
    });
  }
}
