import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/food/cubit/DayPlanner/day_planner_cubit.dart';
import 'package:nutrition_app/food/cubit/DayPlanner/day_planner_state.dart';
import 'package:nutrition_app/food/food_plan_day_meals.dart';

class FoodPlanDaysBar extends StatefulWidget {
  @override
  State<FoodPlanDaysBar> createState() => _FoodPlanDaysBarState();
}

class _FoodPlanDaysBarState extends State<FoodPlanDaysBar>
    with TickerProviderStateMixin {
  late List<String> listPlansDay = ["Empty"];
  int selectedDay = 0;

  @override
  void initState() {
    super.initState();
    context.read<DayPlannerCubit>().getDays();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DayPlannerCubit, DayPlannerState>(
        listener: (context, state) {
      if (state is GetPlanDays) {
        listPlansDay = state.planDays;
      }
    }, builder: (context, state) {
      if (listPlansDay.isEmpty) {
        return const CircularProgressIndicator();
      }
      List<Widget> days = listPlansDay
          .map((e) => Padding(
                padding: EdgeInsets.all(3.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        selectedDay = listPlansDay.indexOf(e);
                      });
                    },
                    child: Text(
                      e,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ))
          .toList();

      days.insert(
          0,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
              icon: Icon(Icons.add),
              onPressed: () {
                context.read<DayPlannerCubit>().addDay();
              },
              label: Text(
                "Add Day",
              ),
            ),
          ));

      TabController dayTabController =
          TabController(length: listPlansDay.length, vsync: this);
      dayTabController.animateTo(selectedDay);
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: SizedBox(),
          ),
          Flexible(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: days),
                ),
                Expanded(
                    flex: 9,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: DefaultTabController(
                            length: listPlansDay.length,
                            initialIndex: selectedDay,
                            child: TabBarView(
                                controller: dayTabController,
                                children: listPlansDay
                                    .map((e) => FoodPlanDayMeals(e))
                                    .toList()),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            color: Colors.grey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 100,
                                ),
                                Text("Daily totals"),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Calories"),
                                    ),
                                    Text("0kcal"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Protein"),
                                    ),
                                    Text("0kcal"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Carbs"),
                                    ),
                                    Text("0kcal"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Fat"),
                                    ),
                                    Text("0kcal"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Saturated fat"),
                                    ),
                                    Text("0kcal"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Sugar"),
                                    ),
                                    Text("0kcal"),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
          const Flexible(
            flex: 1,
            child: SizedBox(),
          )
        ],
      );
    });
  }
}
