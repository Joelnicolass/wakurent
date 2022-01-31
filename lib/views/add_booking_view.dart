import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/models/models.dart';
import 'package:walkiler/widgets/booking_form.dart';

import 'package:walkiler/globals.dart' as g;
import 'package:walkiler/widgets/wakure_crud_menu.dart';

class AddBooking_View extends StatefulWidget {
  const AddBooking_View({Key? key}) : super(key: key);

  @override
  State<AddBooking_View> createState() => _AddBooking_ViewState();
}

class _AddBooking_ViewState extends State<AddBooking_View> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    //responsive
    g.width = MediaQuery.of(context).size.width;
    g.height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Row(
          children: const [
            Icon(Icons.bookmark_add_rounded, color: Colors.grey, size: 30),
            SizedBox(width: 10),
            Text('Reserva', style: TextStyle(fontSize: 18, color: Colors.grey)),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            final bookingBloc = BlocProvider.of<BookingBloc>(context);
            bookingBloc.add(
              SaveAllDateTimeEvent(
                  endDate: '',
                  endTime: '',
                  startDate: '',
                  startTime: '',
                  price: '',
                  wakureList: <Wakure>[],
                  stateBtnReservation: false),
            );

            // back to previous page cleaning context
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: const Center(
        child: bookingForm_card(),
      ),
    );
  }
}

class bookingForm_card extends StatefulWidget {
  const bookingForm_card({
    Key? key,
  }) : super(key: key);

  @override
  State<bookingForm_card> createState() => _bookingForm_cardState();
}

class _bookingForm_cardState extends State<bookingForm_card> {
  @override
  Widget build(BuildContext context) {
    final bookingBloc = BlocProvider.of<BookingBloc>(context);
    final friendBloc = BlocProvider.of<FriendBloc>(context);

    return Container(
      width: g.width * 0.9,
      height: g.height * 0.85,
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
                width: g.width * 0.7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Container(child: Icon(Icons.person, color: Colors.grey)),
                      SizedBox(width: g.width * 0.02),
                      Container(
                        width: g.width * 0.52,
                        child: BlocConsumer<FriendBloc, FriendState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state.friends.isEmpty) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  hint: Text('No hay invitados registrados',
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
                                  bookingBloc.state.selectedItemClient;

                              print('itemSelect: $itemSelect');

                              bool itemExist = friendBloc.state.friends
                                  .any((friend) => friend.name == itemSelect);

                              if (bookingBloc.state.selectedItemClient == '' ||
                                  !itemExist) {
                                itemSelect = friendBloc.state.friends[0].name;
                                bookingBloc.add(
                                  SelectedItemClientEvent(
                                      item: friendBloc.state.friends[0].name,
                                      id: friendBloc.state.friends[0].id),
                                );
                              }

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
                                      String idClientSelected;

                                      for (UserClass f
                                          in friendBloc.state.friends) {
                                        if (f.name == newValue) {
                                          idClientSelected = f.id;
                                          bookingBloc.add(
                                            SelectedItemClientEvent(
                                                item: newValue!,
                                                id: idClientSelected),
                                          );
                                        }
                                      }

                                      itemSelect = newValue!;
                                    });
                                  },
                                  items: friendBloc.state.friends
                                      .map<DropdownMenuItem<String>>(
                                          (UserClass friend) {
                                    return DropdownMenuItem<String>(
                                      value: friend.name,
                                      child: Text(friend.name),
                                    );
                                  }).toList(),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: g.width * 0.7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Container(
                          child: Icon(Icons.electric_scooter_rounded,
                              color: Colors.grey)),
                      SizedBox(width: g.width * 0.02),
                      Container(
                        width: g.width * 0.52,
                        child: BlocConsumer<BookingBloc, BookingState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state.wakureList.isEmpty) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  hint: Text('No hay wakures disponibles',
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
                                  bookingBloc.state.selectedItemWakure;

                              bool itemExist = bookingBloc.state.wakureList
                                  .any((wakure) => wakure.name == itemSelect);

                              if (bookingBloc.state.selectedItemWakure == '' ||
                                  !itemExist) {
                                itemSelect =
                                    bookingBloc.state.wakureList[0].name;
                                bookingBloc.add(
                                  SelectedItemWakureEvent(
                                      item:
                                          bookingBloc.state.wakureList[0].name,
                                      id: bookingBloc
                                          .state.wakureList[0].wakureId),
                                );
                              }

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
                                      String idWakureSelected;

                                      for (Wakure w
                                          in bookingBloc.state.wakureList) {
                                        if (w.name == newValue) {
                                          idWakureSelected = w.wakureId;
                                          bookingBloc.add(
                                            SelectedItemWakureEvent(
                                                item: newValue!,
                                                id: idWakureSelected),
                                          );
                                        }
                                      }

                                      itemSelect = newValue!;
                                    });
                                  },
                                  items: state.wakureList
                                      .map<DropdownMenuItem<String>>(
                                          (Wakure wakure) {
                                    return DropdownMenuItem<String>(
                                      value: wakure.name,
                                      child: Text(wakure.name),
                                    );
                                  }).toList(),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: g.height * 0.02,
            ),
            DateTimeForm(),
          ],
        ),
      ),
    );
  }
}
