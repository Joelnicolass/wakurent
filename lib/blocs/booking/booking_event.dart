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
  final List<Wakure> wakureList;
  final bool stateBtnReservation;

  SaveAllDateTimeEvent({
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.wakureList,
    required this.stateBtnReservation,
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

class VerifyAvailability extends BookingEvent {
  final String id;
  VerifyAvailability({
    required this.id,
  });
}

class SelectedItemWakureEvent extends BookingEvent {
  final String item;
  final String id;

  SelectedItemWakureEvent({
    required this.item,
    required this.id,
  });
}

class SelectedItemClientEvent extends BookingEvent {
  final String item;
  final String id;

  SelectedItemClientEvent({
    required this.item,
    required this.id,
  });
}

class StateBtnReservationEvent extends BookingEvent {
  final bool state;

  StateBtnReservationEvent({
    required this.state,
  });
}

class SelectedDayEvent extends BookingEvent {
  final List<int> day;

  SelectedDayEvent({
    required this.day,
  });
}

class GetAvailableDaysEvent extends BookingEvent {
  final String id;
  final String wakureId;

  GetAvailableDaysEvent({required this.id, required this.wakureId});
}

class ProcessRequest extends BookingEvent {
  final bool state;

  ProcessRequest({
    required this.state,
  });
}

class SaveAvailableDaysEvent extends BookingEvent {
  final List<int> days;
  final wakureId;
  final userId;

  SaveAvailableDaysEvent({
    required this.days,
    required this.wakureId,
    required this.userId,
  });
}
