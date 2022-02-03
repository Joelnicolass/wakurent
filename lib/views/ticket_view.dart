import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/blocs.dart';

import 'package:walkiler/globals.dart' as g;
import 'package:walkiler/models/ticket.dart';
import 'package:walkiler/widgets/button_style.dart';

class Ticket_View extends StatefulWidget {
  const Ticket_View({Key? key}) : super(key: key);

  @override
  State<Ticket_View> createState() => _Ticket_ViewState();
}

class _Ticket_ViewState extends State<Ticket_View> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    //responsive
    g.width = MediaQuery.of(context).size.width;
    g.height = MediaQuery.of(context).size.height;

    // get arguments to previous view
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Row(
          children: [
            const Icon(Icons.electric_scooter_rounded,
                color: Colors.grey, size: 30),
            const SizedBox(width: 10),
            Text(args['wakureName'],
                style: const TextStyle(fontSize: 18, color: Colors.grey)),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.grey,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: ticket_card(
          args: args,
        ),
      ),
    );
  }
}

class ticket_card extends StatefulWidget {
  const ticket_card({
    Key? key,
    required Map<String, dynamic> args,
  }) : super(key: key);

  @override
  State<ticket_card> createState() => _ticket_cardState();
}

class _ticket_cardState extends State<ticket_card> {
  Color color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    final ticketBloc = BlocProvider.of<TicketBloc>(context);

    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Container(
      width: g.width * 0.9,
      height: g.height * 0.8,
      child: Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(0),
          )),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Container(
                          child: Icon(Icons.circle, color: color, size: 12)),
                      SizedBox(width: 20),
                      Container(
                        width: g.width * 0.52,
                        child: BlocConsumer<TicketBloc, TicketState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              if (state.tickets.isEmpty) {
                                return DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    hint: Text('No hay reservas registradas',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[700])),
                                    value: null,
                                    isExpanded: true,
                                    icon: const Icon(Icons.arrow_drop_down,
                                        color: Colors.grey),
                                    dropdownColor: g.background,
                                    style: TextStyle(
                                        color: Colors.grey[400], fontSize: 18),
                                    onChanged: (String? newValue) {
                                      setState(() {});
                                    },
                                    items: [],
                                  ),
                                );
                              } else {
                                String itemSelect =
                                    ticketBloc.state.selectedItemTicket;

                                /* String itemSelect =
                                    ticketBloc.state.selectedItemTicket;

                                bool itemExist = ticketBloc.state.tickets.any(
                                    (ticket) => ticket.status == itemSelect);

                                if (ticketBloc.state.selectedItemTicket == '' ||
                                    !itemExist) {
                                  itemSelect =
                                      ticketBloc.state.tickets[0].status;

                                  ticketBloc.add(SelectedItemTicketEvent(
                                      item: ticketBloc.state.tickets[0].status,
                                      ticketId:
                                          ticketBloc.state.tickets[0].id));
                                } */

                                return DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: itemSelect,
                                    isExpanded: true,
                                    icon: const Icon(Icons.arrow_drop_down,
                                        color: g.red),
                                    dropdownColor: g.background,
                                    style: TextStyle(
                                        color: Colors.grey[400], fontSize: 18),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        String idTicketSelected;

                                        for (Ticket t
                                            in ticketBloc.state.tickets) {
                                          idTicketSelected = t.id;
                                          ticketBloc.add(
                                            SelectedItemTicketEvent(
                                                item: newValue!,
                                                ticketId: idTicketSelected),
                                          );
                                        }

                                        if (newValue == 'PENDING') {
                                          color = Colors.yellow;
                                        }
                                        if (newValue == 'PAID') {
                                          color = Colors.green;
                                        }
                                        if (newValue == 'EXPIRED') {
                                          color = Colors.purple;
                                        }
                                        if (newValue == 'CANCELLED') {
                                          color = Colors.red;
                                        }
                                        if (newValue == 'CONFIRMED') {
                                          color = Colors.blue;
                                        }
                                        if (newValue == 'ARCHIVED') {
                                          color = Colors.grey;
                                        }
                                      });

                                      itemSelect = newValue!;
                                    },
                                    items: <String>[
                                      'PENDING',
                                      'PAID',
                                      'EXPIRED',
                                      'CANCELLED',
                                      'CONFIRMED',
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                );
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: g.width * 0.09),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Desde',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_today_outlined,
                                color: Colors.grey, size: 18),
                            SizedBox(width: 5),
                            Text(
                              args['dateFrom'],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(Icons.access_time,
                                color: Colors.grey, size: 18),
                            SizedBox(width: 5),
                            Text(
                              args['timeFrom'],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Icon(Icons.arrow_forward_rounded,
                        color: Colors.grey, size: 30),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hasta',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_today_outlined,
                                color: Colors.grey, size: 18),
                            SizedBox(width: 5),
                            Text(
                              args['dateTo'],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(Icons.access_time,
                                color: Colors.grey, size: 18),
                            SizedBox(width: 5),
                            Text(
                              args['timeTo'],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 65,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: g.width * 0.03),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 15),
                          child: Row(
                            children: [
                              const Icon(Icons.person,
                                  color: Colors.grey, size: 22),
                              const SizedBox(width: 10),
                              Text(
                                  args['clientName'] +
                                      ' ' +
                                      args['clientSurname'],
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.grey)),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.mail_outline,
                                  color: Colors.grey, size: 20),
                              const SizedBox(width: 10),
                              Text(args['clientEmail'],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14)),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 8,
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.map,
                                  color: Colors.grey, size: 20),
                              const SizedBox(width: 10),
                              Text(args['clientAddress'],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14)),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 8,
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.phone,
                                  color: Colors.grey, size: 20),
                              const SizedBox(width: 10),
                              Text(args['clientPhone'],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14)),
                            ],
                          )),
                    ],
                  ),
                  SizedBox(
                    width: g.width * 0.02,
                  ),
                  NeumorphicButton(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.qr_code_2, color: Colors.grey, size: 50),
                      ],
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.qr_code_2,
                                    size: 280, color: Colors.grey),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Ok',
                                    style: TextStyle(color: Colors.grey)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    },
                    style: button_style(),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            // SEPARATOR
            Center(
              child: Container(
                height: 2,
                width: 350,
                //gradient vertical
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      g.red,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: g.width * 0.2),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('TOTAL', style: TextStyle(fontSize: 20)),
                    Text('\u0024' + args['ticketPrice'].toString(),
                        style: TextStyle(fontSize: 20)),
                  ]),
            ),
            const SizedBox(
              height: 55,
            ),
            // BUTTON
            Center(
              child: Container(
                width: g.width * 0.6,
                child: NeumorphicButton(
                  padding: const EdgeInsets.only(
                      left: 10, right: 18, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.check_circle_outline_rounded,
                          color: Colors.grey),
                      SizedBox(width: 5),
                      Text('Confirmar',
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                  onPressed: () {
                    final authBloc = BlocProvider.of<AuthBloc>(context);
                    final ticketBloc = BlocProvider.of<TicketBloc>(context);
                    final statusSelected = ticketBloc.state.selectedItemTicket;

                    ticketBloc.add(ProcessRequestTicketEvent());

                    ticketBloc.add(
                      ChangeStatusEvent(
                        status: statusSelected,
                        ticketId: args['ticketId'],
                        userId: authBloc.state.user!.id,
                      ),
                    );

                    Navigator.of(context).pushNamedAndRemoveUntil(
                        'ProcessRequestUpdateTicketStatus', (route) => false);
                  },
                  style: button_style(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
