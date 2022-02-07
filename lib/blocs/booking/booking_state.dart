part of 'booking_bloc.dart';

class BookingState extends Equatable {
// arguments
  final String dateFrom;
  final String dateTo;
  final String timeFrom;
  final String timeTo;
  final String price;
  final String clientId;
  final String wakureId;
  final String message;
  final List<UserClass> clientList;
  final List<Wakure> wakureList;
  final bool validate;
  final bool stateBtnReservation;
  final String selectedItemWakure;
  final String selectedItemWakureId;
  final String selectedItemClient;
  final String selectedItemClientId;
  final List<int> selectedDays;
  final List<int> availableDays;
  final bool processRequest;

  BookingState({
    String? dateFrom,
    String? dateTo,
    String? timeFrom,
    String? timeTo,
    String? price,
    String? clientId,
    String? wakureId,
    String? message,
    List<UserClass>? clientList,
    List<Wakure>? wakureList,
    bool? validate,
    bool? stateBtnReservation,
    String? selectedItemWakure,
    String? selectedItemWakureId,
    String? selectedItemClient,
    String? selectedItemClientId,
    List<int>? selectedDays,
    List<int>? availableDays,
    bool? processRequest,
  })  : dateFrom = dateFrom ?? '',
        dateTo = dateTo ?? '',
        timeFrom = timeFrom ?? '',
        timeTo = timeTo ?? '',
        price = price ?? '',
        clientId = clientId ?? '',
        wakureId = wakureId ?? '',
        message = message ?? '',
        clientList = clientList ?? [],
        wakureList = wakureList ?? [],
        validate = validate ?? false,
        stateBtnReservation = stateBtnReservation ?? false,
        selectedItemWakure = selectedItemWakure ?? '',
        selectedItemWakureId = selectedItemWakureId ?? '',
        selectedItemClient = selectedItemClient ?? '',
        selectedItemClientId = selectedItemClientId ?? '',
        selectedDays = selectedDays ?? [],
        availableDays = availableDays ?? [],
        processRequest = processRequest ?? false;

  //copyWith
  BookingState copyWith({
    String? dateFrom,
    String? dateTo,
    String? timeFrom,
    String? timeTo,
    String? price,
    String? clientId,
    String? wakureId,
    String? message,
    List<UserClass>? clientList,
    List<Wakure>? wakureList,
    bool? validate,
    bool? stateBtnReservation,
    String? selectedItemWakure,
    String? selectedItemWakureId,
    String? selectedItemClient,
    String? selectedItemClientId,
    List<int>? selectedDays,
    List<int>? availableDays,
    bool? processRequest,
  }) =>
      BookingState(
        dateFrom: dateFrom ?? this.dateFrom,
        dateTo: dateTo ?? this.dateTo,
        timeFrom: timeFrom ?? this.timeFrom,
        timeTo: timeTo ?? this.timeTo,
        price: price ?? this.price,
        clientId: clientId ?? this.clientId,
        wakureId: wakureId ?? this.wakureId,
        message: message ?? this.message,
        clientList: clientList ?? this.clientList,
        wakureList: wakureList ?? this.wakureList,
        validate: validate ?? this.validate,
        stateBtnReservation: stateBtnReservation ?? this.stateBtnReservation,
        selectedItemWakure: selectedItemWakure ?? this.selectedItemWakure,
        selectedItemWakureId: selectedItemWakureId ?? this.selectedItemWakureId,
        selectedItemClient: selectedItemClient ?? this.selectedItemClient,
        selectedItemClientId: selectedItemClientId ?? this.selectedItemClientId,
        selectedDays: selectedDays ?? this.selectedDays,
        availableDays: availableDays ?? this.availableDays,
        processRequest: processRequest ?? this.processRequest,
      );

  @override
  List<Object> get props => [
        dateFrom,
        dateTo,
        timeFrom,
        timeTo,
        price,
        clientId,
        wakureId,
        message,
        clientList,
        wakureList,
        validate,
        stateBtnReservation,
        selectedItemWakure,
        selectedItemWakureId,
        selectedItemClient,
        selectedItemClientId,
        selectedDays,
        availableDays,
        processRequest,
      ];
}
