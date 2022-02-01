import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:walkiler/models/ticket.dart';
import 'package:walkiler/services/booking_service.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc() : super(TicketState()) {
    on<OnGetTicketsEvent>(_onGetTickets);
    on<ChangeStatusEvent>(_changeStatus);
  }

  // get Tickets
  _onGetTickets(OnGetTicketsEvent event, Emitter<TicketState> emit) {
    emit(state.copyWith(
      tickets: event.tickets,
      processRequest: false,
    ));
  }

  // change Status

  Future<void> _changeStatus(
      ChangeStatusEvent event, Emitter<TicketState> emit) async {
    final Response response = await BookingService.changeState(
      event.ticketId,
      event.userId,
      event.status,
    );

    if (response.statusCode == 200) {
      emit(state.copyWith(
        status: event.status,
      ));
     
    }
  }
}
