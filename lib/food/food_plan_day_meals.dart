import 'package:flutter/material.dart';
import 'package:nutrition_app/food/food_model.dart';

class FoodPlanDayMeals extends StatelessWidget {
  late String dayName;

  FoodPlanDayMeals(this.dayName, {Key? key}) : super(key: key);
  List<MealPlan> meals = [];
  List<FoodModel> foods = [];
  List<Widget> getFoodsWidget(MealPlan meal){
    List<Widget> foods =  meal.foods
        .map((e) => Padding(
      padding: EdgeInsets.all(8),
      child:e.name.isNotEmpty ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(e.name),
          Text(e.name),
          Text(e.name),
          Text(e.name),
          Text(e.name),
        ],
      ) : Text("asdasdas") ,
    ))
        .toList();
    foods.insert(0, Padding(padding: EdgeInsets.all(8), child: Row(
      children: [
        Flexible(child: TextFormField(initialValue: "asdasd",)),
      Flexible(child:  Text("Header"),)
      ],
    ),));
    return foods;
  }
  @override
  Widget build(BuildContext context) {
    FoodModel food = FoodModel();
    food.name = "Name 1";
    foods.add(food);

    FoodModel food2 = FoodModel();
    food2.name = "Name 2";
    foods.add(food2);

    FoodModel food3 = FoodModel();
    food3.name = "Name 3";
    foods.add(food3);

    meals.add(MealPlan(foods));
    meals.add(MealPlan(foods));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(

        height: MediaQuery.of(context).size.height,
        child: Expanded(
          child: Column(
            children: meals
                .map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color:Colors.blueGrey,
                    child: Column(
                          children: getFoodsWidget(e),
                        ),
                  ),
                ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
