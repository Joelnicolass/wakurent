import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingState()) {
    on<SaveAllDateTimeEvent>(_SaveAllDateTimeEvent);
    on<SaveDateFromEvent>(_saveDateFromEvent);
    on<SaveDateToEvent>(_saveDateToEvent);
    on<SaveTimeFromEvent>(_saveTimeFromEvent);
    on<SaveTimeToEvent>(_saveTimeToEvent);
  }

  void _SaveAllDateTimeEvent(
      SaveAllDateTimeEvent event, Emitter<BookingState> emit) {
    //copywith
    emit(state.copyWith(
        dateFrom: event.startDate,
        dateTo: event.endDate,
        timeFrom: event.startTime,
        timeTo: event.endTime));
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
}
