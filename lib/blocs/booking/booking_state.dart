part of 'booking_bloc.dart';

class BookingState extends Equatable {
// arguments
  final String dateFrom;
  final String dateTo;
  final String timeFrom;
  final String timeTo;
  final String clientId;
  final String wakureId;
  final String message;
  final List<UserClass> clientList;
  final List<Wakure> wakureList;
  final bool validate;
  final bool stateBtnReservation;
  final String selectedItem;
  final String selectedItemId;
  final List<String> selectedDay;

  BookingState({
    String? dateFrom,
    String? dateTo,
    String? timeFrom,
    String? timeTo,
    String? clientId,
    String? wakureId,
    String? message,
    List<UserClass>? clientList,
    List<Wakure>? wakureList,
    bool? validate,
    bool? stateBtnReservation,
    String? selectedItem,
    String? selectedItemId,
    List<String>? selectedDay,
  })  : dateFrom = dateFrom ?? '',
        dateTo = dateTo ?? '',
        timeFrom = timeFrom ?? '',
        timeTo = timeTo ?? '',
        clientId = clientId ?? '',
        wakureId = wakureId ?? '',
        message = message ?? '',
        clientList = clientList ?? [],
        wakureList = wakureList ?? [],
        validate = validate ?? false,
        stateBtnReservation = stateBtnReservation ?? false,
        selectedItem = selectedItem ?? '',
        selectedItemId = selectedItemId ?? '',
        selectedDay = selectedDay ?? [];

  //copyWith
  BookingState copyWith({
    String? dateFrom,
    String? dateTo,
    String? timeFrom,
    String? timeTo,
    String? clientId,
    String? wakureId,
    String? message,
    List<UserClass>? clientList,
    List<Wakure>? wakureList,
    bool? validate,
    bool? stateBtnReservation,
    String? selectedItem,
    String? selectedItemId,
    List<String>? selectedDay,
  }) =>
      BookingState(
        dateFrom: dateFrom ?? this.dateFrom,
        dateTo: dateTo ?? this.dateTo,
        timeFrom: timeFrom ?? this.timeFrom,
        timeTo: timeTo ?? this.timeTo,
        clientId: clientId ?? this.clientId,
        wakureId: wakureId ?? this.wakureId,
        message: message ?? this.message,
        clientList: clientList ?? this.clientList,
        wakureList: wakureList ?? this.wakureList,
        validate: validate ?? this.validate,
        stateBtnReservation: stateBtnReservation ?? this.stateBtnReservation,
        selectedItem: selectedItem ?? this.selectedItem,
        selectedItemId: selectedItemId ?? this.selectedItemId,
        selectedDay: selectedDay ?? this.selectedDay,
      );

  @override
  List<Object> get props => [
        dateFrom,
        dateTo,
        timeFrom,
        timeTo,
        clientId,
        wakureId,
        message,
        clientList,
        wakureList,
        validate,
        stateBtnReservation,
        selectedItem,
        selectedItemId,
        selectedDay,
      ];
}
