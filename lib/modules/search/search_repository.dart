import 'dart:developer';

import 'package:meal_app_bloc/modules/search/models/meal_search_model.dart';
import 'package:meal_app_bloc/shared/core/client/client_api.dart';

class SearchRepository {
  final ClientApi clientApi;

  SearchRepository(this.clientApi);

  Future<MealSearchModel> searchMealsByName(String query) async {
    try {
      final response = await clientApi.get('/search.php', queryParameters: {'s': query});
      return MealSearchModel.fromJson(response);
    } catch (e) {
      log('Error in searchMealsByName: $e');
      return Future.error('Failed to search meals: $e');
    }
  }
}
