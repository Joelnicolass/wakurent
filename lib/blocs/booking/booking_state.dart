part of 'booking_bloc.dart';

class BookingState extends Equatable {
// arguments
  final String dateFrom;
  final String dateTo;
  final String timeFrom;
  final String timeTo;

  BookingState(
      {String? dateFrom, String? dateTo, String? timeFrom, String? timeTo})
      : dateFrom = dateFrom ?? '',
        dateTo = dateTo ?? '',
        timeFrom = timeFrom ?? '',
        timeTo = timeTo ?? '';

  //copyWith
  BookingState copyWith(
          {String? dateFrom,
          String? dateTo,
          String? timeFrom,
          String? timeTo}) =>
      BookingState(
          dateFrom: dateFrom ?? this.dateFrom,
          dateTo: dateTo ?? this.dateTo,
          timeFrom: timeFrom ?? this.timeFrom,
          timeTo: timeTo ?? this.timeTo);

  @override
  List<Object> get props => [dateFrom, dateTo, timeFrom, timeTo];
}
