part of 'ticket_bloc.dart';

abstract class TicketEvent extends Equatable {
  const TicketEvent();

  @override
  List<Object> get props => [];
}

// get Tickets
class OnGetTicketsEvent extends TicketEvent {
  final List<Ticket> tickets;

  const OnGetTicketsEvent({required this.tickets});

  @override
  List<Object> get props => [tickets];
}

// add new ticket