import 'package:day_picker/model/day_in_week.dart';
import 'package:flutter/material.dart';
import 'package:day_picker/day_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/helpers/process_days.dart';
import 'package:walkiler/services/booking_service.dart';

import '../globals.dart' as g;

class DayPicker_View extends StatefulWidget {
  //TODO get available days from server

  String wakureId;

  DayPicker_View({Key? key, required this.wakureId}) : super(key: key);

  @override
  State<DayPicker_View> createState() => _DayPicker_ViewState();
}

class _DayPicker_ViewState extends State<DayPicker_View> {
  // List<DayInWeek> days = DaysHandler.getListDaysInWeekFromListInt([1, 3, 4, 6]);

  void getSelectedDays() {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final bookingBloc = BlocProvider.of<BookingBloc>(context);
    final id = authBloc.state.user!.id;
    //bookingBloc.add(ProcessRequest(state: true));
    bookingBloc.add(GetAvailableDaysEvent(id: id, wakureId: widget.wakureId));
  }

  @override
  void initState() {
    super.initState();
    getSelectedDays();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bookingBloc = BlocProvider.of<BookingBloc>(context);
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        if (state.processRequest == true) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SelectWeekDays(
                fontSize: 14,
                unSelectedDayTextColor: Colors.grey,
                fontWeight: FontWeight.w500,
                days: DaysHandler.getListDaysInWeekFromListInt(
                    bookingBloc.state.availableDays),
                border: false,
                daysFillColor: g.red,
                selectedDayTextColor: Colors.white,
                boxDecoration: BoxDecoration(
                  //      border: Border.all(color: Colors.grey.shade700, width: 2),
                  color: g.background,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onSelect: (values) {
                  List<int> days = [];
                  values.forEach((value) {
                    days.add(DaysHandler.getSelectedDayfromString(value));
                  });
                  bookingBloc.add(SelectedDayEvent(day: days));
                  print(days);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
