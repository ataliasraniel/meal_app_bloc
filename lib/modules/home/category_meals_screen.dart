import 'package:flutter/material.dart';
import 'package:meal_app_bloc/modules/home/models/category_model.dart';

class CategoryMealsScreen extends StatelessWidget {
  final Category category;

  const CategoryMealsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.strCategory), elevation: 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'category_${category.idCategory}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(category.strCategoryThumb, width: 200, height: 200, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(category.strCategoryDescription, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 32),
            const Text(
              'Receitas em breve...',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
