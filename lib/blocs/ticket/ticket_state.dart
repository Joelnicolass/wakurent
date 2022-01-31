part of 'ticket_bloc.dart';

class TicketState extends Equatable {
  //arguments
  final List<Ticket> tickets;
  bool processRequest;
  
  TicketState({bool? processRequest, List<Ticket>? tickets})
  : tickets = tickets ?? [],
  processRequest = processRequest ?? false;
  
  //create copyWith
  TicketState copyWith({
    List<Ticket>? tickets,
    bool? processRequest,
  }) {
    return TicketState(
      tickets: tickets ?? this.tickets,
      processRequest: processRequest ?? this.processRequest,
      );
  }

  @override
  List<Object> get props => [tickets, processRequest];
}
