import 'day_planner_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DayPlannerCubit extends Cubit<DayPlannerState> {
  DayPlannerCubit() : super( GetPlanDays([""])) {
  }
  List<String> planDays = [];
  void getDays(){
    emit(GetPlanDays(planDays));
  }
  void addDay(){
    planDays.add("Day " + (planDays.length+1).toString());
    emit(GetPlanDays(planDays));
  }
}