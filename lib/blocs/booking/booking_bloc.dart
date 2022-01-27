import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/helpers/process_response.dart';
import 'package:walkiler/models/models.dart';
import 'package:walkiler/services/booking_service.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingState()) {
    on<SaveAllDateTimeEvent>(_saveAllDateTimeEvent);
    on<SaveDateFromEvent>(_saveDateFromEvent);
    on<SaveDateToEvent>(_saveDateToEvent);
    on<SaveTimeFromEvent>(_saveTimeFromEvent);
    on<SaveTimeToEvent>(_saveTimeToEvent);
    on<VerifyAvailability>(_verifyAvailability);
    on<SelectedItemWakureEvent>(_selectedItemWakureEvent);
    on<SelectedItemClientEvent>(_selectedItemClientEvent);
    on<SelectedDayEvent>(_selectedDayEvent);
  }

  void _saveAllDateTimeEvent(
      SaveAllDateTimeEvent event, Emitter<BookingState> emit) {
    //copywith
    emit(state.copyWith(
        dateFrom: event.startDate,
        dateTo: event.endDate,
        timeFrom: event.startTime,
        timeTo: event.endTime,
        wakureList: event.wakureList,
        stateBtnReservation: event.stateBtnReservation));
  }

  // event dateFrom

  void _saveDateFromEvent(SaveDateFromEvent event, Emitter<BookingState> emit) {
    //copywith
    emit(state.copyWith(
        dateFrom: event.dateFrom,
        dateTo: state.dateTo,
        timeFrom: state.timeFrom,
        timeTo: state.timeTo));
  }

  // event dateTo

  void _saveDateToEvent(SaveDateToEvent event, Emitter<BookingState> emit) {
    //copywith
    emit(state.copyWith(
        dateFrom: state.dateFrom,
        dateTo: event.dateTo,
        timeFrom: state.timeFrom,
        timeTo: state.timeTo));
  }

  // event timeFrom

  void _saveTimeFromEvent(SaveTimeFromEvent event, Emitter<BookingState> emit) {
    //copywith
    emit(state.copyWith(
        dateFrom: state.dateFrom,
        dateTo: state.dateTo,
        timeFrom: event.timeFrom,
        timeTo: state.timeTo));
  }

  // event timeTo

  void _saveTimeToEvent(SaveTimeToEvent event, Emitter<BookingState> emit) {
    //copywith
    emit(state.copyWith(
        dateFrom: state.dateFrom,
        dateTo: state.dateTo,
        timeFrom: state.timeFrom,
        timeTo: event.timeTo));
  }

  // event verify availability

  Future<void> _verifyAvailability(
      VerifyAvailability event, Emitter<BookingState> emit) async {
    final id = event.id;
    final dateFrom = state.dateFrom;
    final dateTo = state.dateTo;
    final timeFrom = state.timeFrom;
    final timeTo = state.timeTo;

    if (dateFrom == "" || dateTo == "" || timeFrom == "" || timeTo == "") {
      emit(state.copyWith(
        wakureList: [],
      ));
      return;
    }

    final req = await BookingService.verifyAvailability(
      id,
      dateFrom,
      dateTo,
      timeFrom,
      timeTo,
    );

    if (req == null) {
      emit(state.copyWith(wakureList: [], stateBtnReservation: false));
      return;
    }

    final wakuresAvailables = req['wakuresAvailable'] as List;
    // final wakuresUnavailables = req['wakuresUnavailable'] as List;

    final List<Wakure> wakures =
        ProcessResponse.getWakureList(wakuresAvailables);

    if (wakures.length >= 1) {
      print('hay uno o mas wakures disponibles');
      emit(state.copyWith(
        wakureList: wakures,
        stateBtnReservation: true,
      ));
      return;
    }
    emit(state.copyWith(
      wakureList: wakures,
      stateBtnReservation: false,
    ));
    return;
  }

  // event selected item
  _selectedItemWakureEvent(
      SelectedItemWakureEvent event, Emitter<BookingState> emit) async {
    emit(state.copyWith(
      selectedItemWakure: event.item,
      selectedItemWakureId: event.id,
    ));
  }

  _selectedItemClientEvent(
      SelectedItemClientEvent event, Emitter<BookingState> emit) async {
    emit(state.copyWith(
      selectedItemClient: event.item,
      selectedItemClientId: event.id,
    ));
  }

  // selected Day of Week for available Wakures
  _selectedDayEvent(SelectedDayEvent event, Emitter<BookingState> emit) async {
    emit(state.copyWith(
      selectedDay: event.day,
    ));
  }
}
