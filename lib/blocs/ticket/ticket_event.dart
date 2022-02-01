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

// change status
class ChangeStatusEvent extends TicketEvent {
  final String status;
  final String ticketId;
  final String userId;

  const ChangeStatusEvent({required this.status, required this.ticketId, required this.userId});

  @override
  List<Object> get props => [status, ticketId, userId];
}