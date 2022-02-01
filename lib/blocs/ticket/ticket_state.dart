part of 'ticket_bloc.dart';

class TicketState extends Equatable {
  //arguments
  final List<Ticket> tickets;
  bool processRequest;
  String status;
  
  TicketState({bool? processRequest, List<Ticket>? tickets, String? status})
  : tickets = tickets ?? [],
  processRequest = processRequest ?? false,
  status = status ?? '';
  
  //create copyWith
  TicketState copyWith({
    List<Ticket>? tickets,
    bool? processRequest,
    String? status,
  }) {
    return TicketState(
      tickets: tickets ?? this.tickets,
      processRequest: processRequest ?? this.processRequest,
      status: status ?? this.status,
      );
  }

  @override
  List<Object> get props => [tickets, processRequest, status];
}
