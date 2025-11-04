import 'dart:developer';

import 'package:meal_app_bloc/modules/recipe/models/recipe_model.dart';
import 'package:meal_app_bloc/shared/core/client/client_api.dart';

class RecipeRepository {
  final ClientApi clientApi;
  RecipeRepository(this.clientApi);

  Future<RecipeModel> getRecipe(String id) async {
    try {
      final response = await clientApi.get('/lookup.php', queryParameters: {'i': id});
      return RecipeModel.fromJson(response);
    } catch (e) {
      log('Error in getRecipe: $e');
      return Future.error('Failed to fetch recipe: $e');
    }
  }
}
