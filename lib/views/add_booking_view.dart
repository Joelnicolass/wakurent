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

    final wakureBloc = BlocProvider.of<WakureBloc>(context);

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
                  wakureList: <Wakure>[]),
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
    String users = 'User1';

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
                      Container(child: Icon(Icons.person, color: Colors.grey)),
                      SizedBox(width: 20),
                      Container(
                        width: g.width * 0.52,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: users,
                            isExpanded: true,
                            icon:
                                const Icon(Icons.arrow_drop_down, color: g.red),
                            dropdownColor: g.background,
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 18),
                            onChanged: (String? newValue) {
                              setState(() {
                                users = newValue!;
                              });
                            },
                            items: <String>['User1', 'User2', 'User3', 'User4']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Container(
                          child: Icon(Icons.electric_scooter_rounded,
                              color: Colors.grey)),
                      SizedBox(width: 20),
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
                              String itemSelect = state.wakureList[0].name;
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
                                      itemSelect = newValue!;
                                      print(newValue);
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
              height: 30,
            ),
            DateTimeForm()
          ],
        ),
      ),
    );
  }
}
