part of 'ticket_bloc.dart';

class TicketState extends Equatable {
  //arguments
  final List<Ticket> tickets;
  final bool processRequest;
  final String status;
  final String selectedItemTicket;
  final String selectedItemTicketId;

  TicketState(
      {bool? processRequest,
      List<Ticket>? tickets,
      String? status,
      String? selectedItemTicket,
      String? selectedItemTicketId})
      : tickets = tickets ?? [],
        processRequest = processRequest ?? false,
        status = status ?? '',
        selectedItemTicket = selectedItemTicket ?? '',
        selectedItemTicketId = selectedItemTicketId ?? '';

  //create copyWith
  TicketState copyWith({
    List<Ticket>? tickets,
    bool? processRequest,
    String? status,
    String? selectedItemTicket,
    String? selectedItemTicketId,
  }) {
    return TicketState(
      tickets: tickets ?? this.tickets,
      processRequest: processRequest ?? this.processRequest,
      status: status ?? this.status,
      selectedItemTicket: selectedItemTicket ?? this.selectedItemTicket,
      selectedItemTicketId : selectedItemTicketId ?? this.selectedItemTicketId,
    );
  }

  @override
  List<Object> get props => [tickets, processRequest, status, selectedItemTicket, selectedItemTicketId];
}
