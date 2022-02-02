// ignore_for_file: annotate_overrides

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/globals.dart' as g;
import 'package:walkiler/helpers/process_response.dart';
import 'package:walkiler/services/booking_service.dart';
import 'package:walkiler/services/services.dart';
import 'package:walkiler/widgets/no_scroll_glow.dart';

import 'package:animate_do/animate_do.dart';

class Booking_View extends StatefulWidget {
  Booking_View({Key? key}) : super(key: key);

  @override
  State<Booking_View> createState() => _Booking_ViewState();
}

class _Booking_ViewState extends State<Booking_View> {
  //getTickets
  Future<void> resTickets() async {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final id = authBloc.state.user!.id;
    final httpRes = await BookingService.getAllTickets(id);
    final List<dynamic> list = httpRes as List;
    final tickets = ProcessResponse.getTicketList(list);

    //final clientList = ProcessResponse.getClientList(tickets);
    final ticketBloc = BlocProvider.of<TicketBloc>(context);
    ticketBloc.add(OnGetTicketsEvent(tickets: tickets));
  }

  // get friends
  Future<void> resFriends() async {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final friendBloc = BlocProvider.of<FriendBloc>(context);
    final httpRes = await FriendService.getFriends(authBloc.state.user!.id);

    if (httpRes != null) {
      List<dynamic> jsonList = httpRes as List;
      final friends = ProcessResponse.getFriendList(jsonList);
      friendBloc.add(OnGetFriendsEvent(friends: friends));
    }
  }

  @override
  void initState() {
    resTickets();
    resFriends();
    super.initState();
  }

  Widget build(BuildContext context) {
    //responsive
    g.width = MediaQuery.of(context).size.width;
    g.height = MediaQuery.of(context).size.height;

    return BlocBuilder<TicketBloc, TicketState>(builder: (context, state) {
      if (state.tickets.length < 1) {
        final authBloc = BlocProvider.of<AuthBloc>(context);

        return Scaffold(
          appBar: NeumorphicAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('role_selector', (route) => false);
              },
            ),
            iconTheme: const IconThemeData(
              color: Colors.grey,
            ),
          ),
          backgroundColor: NeumorphicTheme.baseColor(context),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("No tiene Reservas registradas"),
                SizedBox(height: 20),
                NeumorphicButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: g.width * 0.1,
                    vertical: g.height * 0.015,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'add_booking_view');
                  },
                  style: NeumorphicStyle(
                    depth: 1.5,
                    intensity: 0.8,
                    shadowLightColor: const Color.fromRGBO(255, 0, 0, 1),
                    oppositeShadowLightSource: true,
                    shape: NeumorphicShape.convex,
                    boxShape:
                        NeumorphicBoxShape.roundRect(const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(25),
                    )),
                  ),
                  child: const Text(
                    'Agregar Reserva',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return Scaffold(
          appBar: NeumorphicAppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () => Navigator.of(context).pop(),
            ),
            iconTheme: const IconThemeData(
              color: Colors.grey,
            ),
          ),
          backgroundColor: NeumorphicTheme.baseColor(context),
          body: Column(
            children: <Widget>[
              const Text('Mis Reservas',
                  style: TextStyle(fontSize: 20, color: Colors.grey)),
              SizedBox(
                height: g.height * 0.02,
              ),
              Container(
                height: g.height * 0.79,
                child: ScrollConfiguration(
                  behavior: NoScrollGlow(),
                  child: ListView.builder(
                      itemCount: state.tickets.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return SlideInRight(
                          child: booking_card(
                            clientName: state.tickets[index].client[0].name,
                            clientSurname:
                                state.tickets[index].client[0].surname,
                            clientEmail: state.tickets[index].client[0].email,
                            clientAddress:
                                state.tickets[index].client[0].address,
                            clientPhone: state.tickets[index].client[0].phone,
                            ticketPrice: state.tickets[index].price,
                            ticketId: state.tickets[index].id,
                            ticketStatus: state.tickets[index].status,
                            wakureName: state.tickets[index].wakure[0].name,
                            dateFrom: state.tickets[index].dateFrom
                                .toString()
                                .substring(0, 10),
                            dateTo: state.tickets[index].dateTo
                                .toString()
                                .substring(0, 10),
                            timeFrom: state.tickets[index].timeFrom.toString(),
                            timeTo: state.tickets[index].timeTo.toString(),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
          floatingActionButton: NeumorphicFloatingActionButton(
            style: const NeumorphicStyle(
                boxShape: NeumorphicBoxShape.circle(),
                shape: NeumorphicShape.convex,
                depth: 1.5,
                intensity: 0.3),
            onPressed: () {
              Navigator.pushNamed(context, 'add_booking_view');
            },
            child: const Icon(Icons.add, color: Colors.white54),
          ),
        );
      }
    });
  }
}

class booking_card extends StatefulWidget {
  const booking_card({
    Key? key,
    required this.clientName,
    required this.clientSurname,
    required this.wakureName,
    required this.dateFrom,
    required this.dateTo,
    required this.timeFrom,
    required this.timeTo,
    required this.clientEmail,
    required this.clientAddress,
    required this.clientPhone,
    required this.ticketPrice,
    required this.ticketId,
    required this.ticketStatus,
  }) : super(key: key);

  final String clientName;
  final String clientSurname;
  final String wakureName;
  final String dateFrom;
  final String dateTo;
  final String timeFrom;
  final String timeTo;
  final String clientEmail;
  final String clientAddress;
  final String clientPhone;
  final int ticketPrice;
  final String ticketId;
  final String ticketStatus;

  @override
  State<booking_card> createState() => _booking_cardState();
}

class _booking_cardState extends State<booking_card> {
  @override
  Widget build(BuildContext context) {
    final ticketBloc = BlocProvider.of<TicketBloc>(context);
    Color color = Colors.yellow;

    setState(() {
      if (ticketBloc.state.status == 'PENDING') {
        color = Colors.yellow;
      }
      if (ticketBloc.state.status == 'CONFIRMED') {
        color = Colors.green;
      }
      if (ticketBloc.state.status == 'CANCELLED') {
        color = Colors.red;
      }
    });

    return NeumorphicButton(
      margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      onPressed: () {
        Navigator.pushNamed(context, 'ticket_view', arguments: {
          'clientName': widget.clientName,
          'clientSurname': widget.clientSurname,
          'wakureName': widget.wakureName,
          'dateFrom': widget.dateFrom,
          'dateTo': widget.dateTo,
          'timeFrom': widget.timeFrom,
          'timeTo': widget.timeTo,
          'clientEmail': widget.clientEmail,
          'clientAddress': widget.clientAddress,
          'clientPhone': widget.clientPhone,
          'ticketPrice': widget.ticketPrice,
          'ticketId': widget.ticketId,
          'ticketStatus': widget.ticketStatus,
        });
      },
      style: NeumorphicStyle(
        depth: 1.5,
        intensity: 1,
        shadowLightColor: Color.fromRGBO(255, 0, 0, 1),
        oppositeShadowLightSource: true,
        shape: NeumorphicShape.convex,
        boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(25),
        )),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.electric_scooter,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
              Text(
                widget.wakureName,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(
                width: g.width * 0.21,
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.person, color: Colors.grey, size: 30),
              ),
              Text(
                widget.clientName + ' ' + widget.clientSurname,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: g.width * 0.3,
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
                          widget.dateFrom,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.grey, size: 18),
                        SizedBox(width: 5),
                        Text(
                          widget.timeFrom,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 80,
              ),
              Container(
                width: g.width * 0.3,
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
                          widget.dateTo,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.grey, size: 18),
                        SizedBox(width: 5),
                        Text(
                          widget.timeTo,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: const EdgeInsets.only(right: 1.0),
                      child: Icon(Icons.attach_money_sharp,
                          size: 20, color: Colors.grey),
                    ),
                    Text('550', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              SizedBox(width: 180),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.circle, size: 10, color: color),
                    ),
                    Text(widget.ticketStatus,
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
