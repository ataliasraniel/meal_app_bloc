import 'dart:developer';

import 'package:meal_app_bloc/modules/home/models/category_model.dart';
import 'package:meal_app_bloc/modules/home/models/meal_model.dart';
import 'package:meal_app_bloc/shared/core/client/client_api.dart';

class HomeRepository {
  final ClientApi clientApi;
  HomeRepository(this.clientApi);
  Future<CategoryModel> fetchCategories() async {
    try {
      final response = await clientApi.get('/categories.php');
      return CategoryModel.fromJson(response);
    } catch (e) {
      log('Error in fetchCategories: $e');
      return Future.error('Failed to fetch categories: $e');
    }
  }
}
