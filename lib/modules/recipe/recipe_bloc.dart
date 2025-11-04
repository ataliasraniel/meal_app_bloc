import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app_bloc/modules/recipe/models/recipe_model.dart';
import 'package:meal_app_bloc/modules/recipe/recipe_repository.dart';

abstract class RecipeEvent {}

abstract class RecipeState {}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final Recipe recipe;
  RecipeLoaded(this.recipe);
}

class RecipeError extends RecipeState {
  final String message;
  RecipeError(this.message);
}

class FetchRecipe extends RecipeEvent {
  final String recipeId;
  FetchRecipe(this.recipeId);
}

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeRepository recipeRepository;

  RecipeBloc(this.recipeRepository) : super(RecipeInitial()) {
    on<FetchRecipe>((event, emit) async {
      emit(RecipeLoading());
      try {
        final recipeModel = await recipeRepository.getRecipe(event.recipeId);
        if (recipeModel.meals != null && recipeModel.meals!.isNotEmpty) {
          emit(RecipeLoaded(recipeModel.meals!.first));
        } else {
          emit(RecipeError('Receita não encontrada'));
        }
      } catch (e) {
        log('Error fetching recipe: $e');
        emit(RecipeError(e.toString()));
      }
    });
  }
}
