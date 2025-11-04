// {"meals":[{"idMeal":"52772","strMeal":"Teriyaki Chicken Casserole","strMealAlternate":null,"strCategory":"Chicken","strArea":"Japanese","strInstructions":"Preheat oven to 350\u00b0 F. Spray a 9x13-inch baking pan with non-stick spray.\r\nCombine soy sauce, \u00bd cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling.\r\nMeanwhile, stir together the corn starch and 2 tablespoons of water in a separate dish until smooth. Once sauce is boiling, add mixture to the saucepan and stir to combine. Cook until the sauce starts to thicken then remove from heat.\r\nPlace the chicken breasts in the prepared pan. Pour one cup of the sauce over top of chicken. Place chicken in oven and bake 35 minutes or until cooked through. Remove from oven and shred chicken in the dish using two forks.\r\n*Meanwhile, steam or cook the vegetables according to package directions.\r\nAdd the cooked vegetables and rice to the casserole dish with the chicken. Add most of the remaining sauce, reserving a bit to drizzle over the top when serving. Gently toss everything together in the casserole dish until combined. Return to oven and cook 15 minutes. Remove from oven and let stand 5 minutes before serving. Drizzle each serving with remaining sauce. Enjoy!","strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/wvpsxx1468256321.jpg","strTags":"Meat,Casserole","strYoutube":"https:\/\/www.youtube.com\/watch?v=4aZr5hZXP_s","strIngredient1":"soy sauce","strIngredient2":"water","strIngredient3":"brown sugar","strIngredient4":"ground ginger","strIngredient5":"minced garlic","strIngredient6":"cornstarch","strIngredient7":"chicken breasts","strIngredient8":"stir-fry vegetables","strIngredient9":"brown rice","strIngredient10":"","strIngredient11":"","strIngredient12":"","strIngredient13":"","strIngredient14":"","strIngredient15":"","strIngredient16":null,"strIngredient17":null,"strIngredient18":null,"strIngredient19":null,"strIngredient20":null,"strMeasure1":"3\/4 cup","strMeasure2":"1\/2 cup","strMeasure3":"1\/4 cup","strMeasure4":"1\/2 teaspoon","strMeasure5":"1\/2 teaspoon","strMeasure6":"4 Tablespoons","strMeasure7":"2","strMeasure8":"1 (12 oz.)","strMeasure9":"3 cups","strMeasure10":"","strMeasure11":"","strMeasure12":"","strMeasure13":"","strMeasure14":"","strMeasure15":"","strMeasure16":null,"strMeasure17":null,"strMeasure18":null,"strMeasure19":null,"strMeasure20":null,"strSource":null,"strImageSource":null,"strCreativeCommonsConfirmed":null,"dateModified":null}]}
class RecipeModel {
  List<Recipe>? meals;

  RecipeModel({this.meals});

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(meals: json["meals"] != null ? List<Recipe>.from(json["meals"].map((x) => Recipe.fromJson(x))) : null);

  Map<String, dynamic> toJson() => {"meals": meals != null ? List<dynamic>.from(meals!.map((x) => x.toJson())) : null};
}

class Recipe {
  String idMeal;
  String strMeal;
  String? strMealAlternate;
  String? strCategory;
  String? strArea;
  String strInstructions;
  String strMealThumb;
  String? strTags;
  String? strYoutube;
  String? strSource;
  List<Ingredient> ingredients;

  Recipe({required this.idMeal, required this.strMeal, this.strMealAlternate, this.strCategory, this.strArea, required this.strInstructions, required this.strMealThumb, this.strTags, this.strYoutube, this.strSource, required this.ingredients});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    List<Ingredient> ingredients = [];
    for (int i = 1; i <= 20; i++) {
      String? ingredient = json["strIngredient$i"];
      String? measure = json["strMeasure$i"];
      if (ingredient != null && ingredient.trim().isNotEmpty) {
        ingredients.add(Ingredient(name: ingredient, measure: measure ?? ""));
      }
    }

    return Recipe(
      idMeal: json["idMeal"] ?? "",
      strMeal: json["strMeal"] ?? "",
      strMealAlternate: json["strMealAlternate"],
      strCategory: json["strCategory"],
      strArea: json["strArea"],
      strInstructions: json["strInstructions"] ?? "",
      strMealThumb: json["strMealThumb"] ?? "",
      strTags: json["strTags"],
      strYoutube: json["strYoutube"],
      strSource: json["strSource"],
      ingredients: ingredients,
    );
  }

  Map<String, dynamic> toJson() => {"idMeal": idMeal, "strMeal": strMeal, "strMealAlternate": strMealAlternate, "strCategory": strCategory, "strArea": strArea, "strInstructions": strInstructions, "strMealThumb": strMealThumb, "strTags": strTags, "strYoutube": strYoutube, "strSource": strSource};

  List<String> get tagsList {
    if (strTags == null || strTags!.isEmpty) return [];
    return strTags!.split(',').map((e) => e.trim()).toList();
  }
}

class Ingredient {
  String name;
  String measure;

  Ingredient({required this.name, required this.measure});
}
