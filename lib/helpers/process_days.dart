import 'package:day_picker/model/day_in_week.dart';

class DaysHandler {
  static int getSelectedDayfromString(String day) {
    int selectedDay = 0;
    switch (day) {
      case 'Dom':
        selectedDay = 0;
        break;
      case 'Lun':
        selectedDay = 1;
        break;
      case 'Mar':
        selectedDay = 2;
        break;
      case 'Mie':
        selectedDay = 3;
        break;
      case 'Jue':
        selectedDay = 4;
        break;
      case 'Vie':
        selectedDay = 5;
        break;
      case 'Sab':
        selectedDay = 6;
        break;
      default:
        break;
    }
    return selectedDay;
  }

  static List<int> getSelectedDays(List<DayInWeek> daysString) {
    List<int> selectedDays = [];

    for (DayInWeek day in daysString) {
      switch (day.dayName) {
        case 'Dom':
          if (day.isSelected) {
            selectedDays.add(0);
          }
          break;
        case 'Lun':
          if (day.isSelected) {
            selectedDays.add(1);
          }
          break;
        case 'Mar':
          if (day.isSelected) {
            selectedDays.add(2);
          }
          break;
        case 'Mie':
          if (day.isSelected) {
            selectedDays.add(3);
          }
          break;
        case 'Jue':
          if (day.isSelected) {
            selectedDays.add(4);
          }
          break;
        case 'Vie':
          if (day.isSelected) {
            selectedDays.add(5);
          }
          break;
        case 'Sab':
          if (day.isSelected) {
            selectedDays.add(6);
          }
          break;

        default:
          break;
      }
    }

    return selectedDays;
  }

  // get name of day
  static String getDayName(int day) {
    switch (day) {
      case 0:
        return 'Dom';
      case 1:
        return 'Lun';
      case 2:
        return 'Mar';
      case 3:
        return 'Mie';
      case 4:
        return 'Jue';
      case 5:
        return 'Vie';
      case 6:
        return 'Sab';
      default:
        return 'No day';
    }
  }

  // convert a list of ints to a list of DayInWeek

  static List<DayInWeek> getListDaysInWeekFromListInt(List<int> days) {
    List<DayInWeek> daysInWeek = [];

    for (var i = 0; i < 7; i++) {
      daysInWeek.add(
        DayInWeek(
          getDayName(i),
          isSelected: days.contains(i),
        ),
      );
    }

    return daysInWeek;
  }
}
