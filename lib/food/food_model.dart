enum FoodCategory {
  poultry,
  beef,
}

class FoodModel {
  late FoodCategory foodCategory;
  late String name ="";
  late int servingSize;
  late int calories;
  late int fat;
  late int saturatedFat;
  late int polyunsaturatedFat;
  late int monounsaturatedFat;
  late int cholesterol;
  late int sodium;
  late int carbs;
  late int sugar;
  late int fiber;
  late int protein;
  late int vitaminA;
  late int vitaminB1Thiamin;
  late int vitaminB2Riboflavin;
  late int vitaminB3Niacin;
  late int vitaminB5PantothenicAcid;
  late int vitaminB6;
  late int vitaminB9Folate;
  late int vitaminB12;
  late int vitaminC;
  late int vitaminD;
  late int vitaminEAlphaTocopherol;
  late int vitaminKPhylloquinone;
  late int magnesium;
  late int calcium;
  late int phosphorus;
  late int potassium;
  late int iron;
  late int selenium;
  late int zinc;
  late int manganese;
  late int copper;
}

class DayPlan {
  late List<MealPlan> meals;

}

class MealPlan {
  late List<FoodModel> foods;
  MealPlan(this.foods);
}