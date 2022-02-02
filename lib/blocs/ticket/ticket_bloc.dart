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
    on<ProcessRequestTicketEvent>(_processRequestTicket);
    on<SelectedItemTicketEvent>(_selectedItemTicket);
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

  // process Request

  Future<void> _processRequestTicket(
      ProcessRequestTicketEvent event, Emitter<TicketState> emit) async {
    emit(state.copyWith(
      processRequest: true,
      tickets: state.tickets,
    ));
  }

  // event selected item
  _selectedItemTicket(
      SelectedItemTicketEvent event, Emitter<TicketState> emit) async {
    emit(state.copyWith(
      selectedItemTicket: event.item,
      selectedItemTicketId: event.ticketId,
    ));
  }
}
