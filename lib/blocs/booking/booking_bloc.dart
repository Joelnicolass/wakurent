import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
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
    on<SavePriceEvent>(_savePriceEvent);
    on<VerifyAvailability>(_verifyAvailability);
    on<SelectedItemWakureEvent>(_selectedItemWakureEvent);
    on<SelectedItemClientEvent>(_selectedItemClientEvent);
    on<SelectedDayEvent>(_selectedDayEvent);
    on<GetAvailableDaysEvent>(_getAvailableDaysEvent);
    on<SaveAvailableDaysEvent>(_saveAvailableDaysEvent);
    on<AddBookingEvent>(_addBookingEvent);

    on<ProcessRequest>(_processRequest);
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

  // event price

  void _savePriceEvent(SavePriceEvent event, Emitter<BookingState> emit) {
    //copywith
    emit(state.copyWith(
        dateFrom: state.dateFrom,
        dateTo: state.dateTo,
        timeFrom: state.timeFrom,
        timeTo: state.timeTo,
        price: event.price));
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
      selectedDays: event.day,
    ));
  }

  // get available days
  _getAvailableDaysEvent(
      GetAvailableDaysEvent event, Emitter<BookingState> emit) async {
    final availableDays =
        await BookingService.getAvailableDays(event.id, event.wakureId);

    // convert to list int
    final daysList = availableDays['availablesDays'] as List;

    final daysNumber = daysList.map((e) {
      return int.parse("$e");
    }).toList();

    emit(state.copyWith(
      processRequest: false,
      availableDays: daysNumber,
    ));
  }

  // save available days
  _saveAvailableDaysEvent(
      SaveAvailableDaysEvent event, Emitter<BookingState> emit) async {
    emit(state.copyWith(
      processRequest: true,
    ));

    final String userId = event.userId;
    final String wakureId = event.wakureId;
    final List<int> days = event.days;

    final req = await BookingService.saveAvailableDays(userId, wakureId, days);

    if (req == null) {
      emit(state.copyWith(
        processRequest: false,
      ));
      return;
    }

    emit(state.copyWith(
      availableDays: event.days,
      selectedDays: [],
      processRequest: false,
    ));

    return;
  }

  // add booking
  Future<void> _addBookingEvent(
      AddBookingEvent event, Emitter<BookingState> emit) async {
    emit(state.copyWith(
      processRequest: true,
    ));

    final String userId = event.userId;
    final String wakureId = event.wakureId;
    final String dateFrom = event.dateFrom;
    final String dateTo = event.dateTo;
    final String timeFrom = event.timeFrom;
    final String timeTo = event.timeTo;
    final String price = event.price;
    final String clientId = event.clientId;

    final req = await BookingService.addTicket(
      userId,
      clientId,
      wakureId,
      price,
      dateFrom,
      dateTo,
      timeFrom,
      timeTo,
    );

    if (req == null) {
      emit(state.copyWith(
        processRequest: false,
      ));
      return;
    }

    emit(state.copyWith(
      processRequest: false,
    ));

    return;
  }

  // process request
  _processRequest(ProcessRequest event, Emitter<BookingState> emit) async {
    emit(state.copyWith(
      processRequest: true,
    ));
  }
}
