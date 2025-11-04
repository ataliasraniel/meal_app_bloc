import 'dart:convert';

MealSearchModel mealSearchModelFromJson(String str) => MealSearchModel.fromJson(json.decode(str));

String mealSearchModelToJson(MealSearchModel data) => json.encode(data.toJson());

class MealSearchModel {
  List<MealSearch>? meals;

  MealSearchModel({this.meals});

  factory MealSearchModel.fromJson(Map<String, dynamic> json) => MealSearchModel(meals: json["meals"] != null ? List<MealSearch>.from(json["meals"].map((x) => MealSearch.fromJson(x))) : null);

  Map<String, dynamic> toJson() => {"meals": meals != null ? List<dynamic>.from(meals!.map((x) => x.toJson())) : null};
}

class MealSearch {
  String idMeal;
  String strMeal;
  String? strDrinkAlternate;
  String? strCategory;
  String? strArea;
  String strInstructions;
  String strMealThumb;
  String? strTags;
  String? strYoutube;

  MealSearch({required this.idMeal, required this.strMeal, this.strDrinkAlternate, this.strCategory, this.strArea, required this.strInstructions, required this.strMealThumb, this.strTags, this.strYoutube});

  factory MealSearch.fromJson(Map<String, dynamic> json) => MealSearch(
    idMeal: json["idMeal"] ?? "",
    strMeal: json["strMeal"] ?? "",
    strDrinkAlternate: json["strDrinkAlternate"],
    strCategory: json["strCategory"],
    strArea: json["strArea"],
    strInstructions: json["strInstructions"] ?? "",
    strMealThumb: json["strMealThumb"] ?? "",
    strTags: json["strTags"],
    strYoutube: json["strYoutube"],
  );

  Map<String, dynamic> toJson() => {"idMeal": idMeal, "strMeal": strMeal, "strDrinkAlternate": strDrinkAlternate, "strCategory": strCategory, "strArea": strArea, "strInstructions": strInstructions, "strMealThumb": strMealThumb, "strTags": strTags, "strYoutube": strYoutube};
}
