part of 'booking_bloc.dart';

abstract class BookingEvent extends Equatable {
  const BookingEvent();

  @override
  List<Object> get props => [];
}

class SaveAllDateTimeEvent extends BookingEvent {
  final String startDate;
  final String endDate;
  final String startTime;
  final String endTime;

  SaveAllDateTimeEvent({
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
  });
}

class SaveDateFromEvent extends BookingEvent {
  final String dateFrom;

  SaveDateFromEvent({
    required this.dateFrom,
  });
}

class SaveDateToEvent extends BookingEvent {
  final String dateTo;

  SaveDateToEvent({
    required this.dateTo,
  });
}

class SaveTimeFromEvent extends BookingEvent {
  final String timeFrom;

  SaveTimeFromEvent({
    required this.timeFrom,
  });
}

class SaveTimeToEvent extends BookingEvent {
  final String timeTo;

  SaveTimeToEvent({
    required this.timeTo,
  });
}