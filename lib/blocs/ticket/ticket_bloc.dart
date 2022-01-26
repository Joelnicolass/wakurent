import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:walkiler/models/ticket.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc() : super(TicketState()) {
    on<OnGetTicketsEvent>(_onGetTickets);
  }

  _onGetTickets(OnGetTicketsEvent event, Emitter<TicketState> emit){

    print('desde el bloc');

    emit(state.copyWith(
      tickets: event.tickets,
      processRequest: false,
    ));
  }
}
