import 'package:flutter/material.dart';

abstract class DayPlannerState{}

class GetPlanDays extends DayPlannerState {
  List<String> planDays;
  GetPlanDays(this.planDays);
}
