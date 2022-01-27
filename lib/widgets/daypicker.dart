import 'package:day_picker/model/day_in_week.dart';
import 'package:flutter/material.dart';
import 'package:day_picker/day_picker.dart';

import '../globals.dart' as g;

class DayPicker_View extends StatelessWidget {
  List<DayInWeek> _days = [
    DayInWeek("Dom", isSelected: true),
    DayInWeek("Lun", isSelected: true),
    DayInWeek("Mar", isSelected: true),
    DayInWeek("Mie", isSelected: true),
    DayInWeek("Jue", isSelected: true),
    DayInWeek("Vie", isSelected: true),
    DayInWeek("Sab", isSelected: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SelectWeekDays(
            fontSize: 14,
            unSelectedDayTextColor: Colors.grey,
            fontWeight: FontWeight.w500,
            days: _days,
            border: false,
            daysFillColor: g.red,
            selectedDayTextColor: Colors.white,
            boxDecoration: BoxDecoration(
            //      border: Border.all(color: Colors.grey.shade700, width: 2),
              color: g.background,
              borderRadius: BorderRadius.circular(30.0),
            ),
            onSelect: (values) {
              print(values);
            },
          ),
        ),
      ],
    );
  }
}
