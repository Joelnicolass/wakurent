import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:lottie/lottie.dart';
import 'package:walkiler/blocs/auth/auth_bloc.dart';
import 'package:walkiler/blocs/booking/booking_bloc.dart';
import 'package:walkiler/models/models.dart';

import '../globals.dart' as g;

class DateTimeForm extends StatefulWidget {
  @override
  _DateTimeFormState createState() => _DateTimeFormState();
}

class _DateTimeFormState extends State<DateTimeForm> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final bookingBloc = BlocProvider.of<BookingBloc>(context);

    //responsive
    g.width = MediaQuery.of(context).size.width;
    g.height = MediaQuery.of(context).size.height;

    // functions for changing state

    void _saveTimeFrom(String time) {
      final bookingBloc = BlocProvider.of<BookingBloc>(context);
      bookingBloc.add(
        SaveTimeFromEvent(timeFrom: time),
      );
    }

    void _saveTimeTo(String time) {
      final bookingBloc = BlocProvider.of<BookingBloc>(context);
      bookingBloc.add(
        SaveTimeToEvent(timeTo: time),
      );
    }

    void _saveDateFrom(String date) {
      final bookingBloc = BlocProvider.of<BookingBloc>(context);
      bookingBloc.add(
        SaveDateFromEvent(dateFrom: date),
      );
    }

    void _saveDateTo(String date) {
      final bookingBloc = BlocProvider.of<BookingBloc>(context);
      bookingBloc.add(
        SaveDateToEvent(dateTo: date),
      );
    }

    void _saveAllDateTime() {
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
    }

    void _savePrice(String priceBooking) {
      final bookingBloc = BlocProvider.of<BookingBloc>(context);
      bookingBloc.add(
        SavePriceEvent(
          price: priceBooking,
        ),
      );
    }

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DateField(
            label: 'Desde',
            function: _saveDateFrom,
          ),
          SizedBox(height: g.height * 0.01),
          ClockPicker(
            label: 'Horario',
            function: _saveTimeFrom,
          ),
          SizedBox(height: g.height * 0.01),

          // separator with gradient
          Center(
            child: Container(
              height: g.height * 0.001,
              width: g.width * 0.8,
              //gradient vertical
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white54,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: g.height * 0.01),
          DateField(
            label: 'Hasta',
            function: _saveDateTo,
          ),
          SizedBox(height: g.height * 0.01),
          ClockPicker(label: 'Horario', function: _saveTimeTo),
          SizedBox(height: g.height * 0.01),
          Center(
            child: Container(
              height: g.height * 0.001,
              width: g.width * 0.8,
              //gradient vertical
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white54,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: g.height * 0.01),

          PriceField(function: _savePrice, label: 'Precio'),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Center(
              child: Container(
                width: g.width * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NeumorphicButton(
                      padding: const EdgeInsets.only(
                          left: 10, right: 5, top: 10, bottom: 10),
                      child: Row(
                        children: const [
                          Icon(Icons.settings_backup_restore_rounded,
                              color: Colors.grey),
                          SizedBox(width: 5),
                        ],
                      ),
                      style: button_style(),
                      onPressed: () {
                        _saveAllDateTime();
                        formKey.currentState?.reset();
                      },
                    ),
                    NeumorphicButton(
                      padding: EdgeInsets.only(
                          left: 45, right: 65, top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Icon(Icons.check_outlined, color: Colors.grey),
                          SizedBox(width: g.height * 0.01),
                          Text('Validar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ],
                      ),
                      style: button_style(),
                      onPressed: () {
                        final bookingBloc =
                            BlocProvider.of<BookingBloc>(context);
                        final authBloc = BlocProvider.of<AuthBloc>(context);

                        formKey.currentState?.save();
                        bookingBloc.add(
                          VerifyAvailability(id: authBloc.state.user!.id),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: g.height * 0.02),
          Center(
            child: Container(
              width: g.width * 0.6,
              child: NeumorphicButton(
                padding: const EdgeInsets.only(
                    left: 10, right: 18, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.bookmark_added_rounded, color: Colors.grey),
                    SizedBox(width: 5),
                    Text('Reservar',
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ],
                ),
                onPressed: () {
                  final bookingBloc = BlocProvider.of<BookingBloc>(context);
                  if (bookingBloc.state.stateBtnReservation == false) {
                    // popup for alert
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Lottie.asset(
                                'assets/alert.json',
                                width: g.width * 0.4,
                                height: g.height * 0.2,
                              ),
                              Text('Debe validar antes de reservar'),
                            ],
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                    return;
                  } else {
                    formKey.currentState?.save();

                    final userId =
                        BlocProvider.of<AuthBloc>(context).state.user!.id;
                    final clientId = bookingBloc.state.selectedItemClientId;
                    final wakureId = bookingBloc.state.selectedItemWakureId;
                    final price = bookingBloc.state.price;
                    final dateFrom = bookingBloc.state.dateFrom;
                    final dateTo = bookingBloc.state.dateTo;
                    final timeFrom = bookingBloc.state.timeFrom;
                    final timeTo = bookingBloc.state.timeTo;

                    bookingBloc.add(AddBookingEvent(
                        userId: userId,
                        clientId: clientId,
                        wakureId: wakureId,
                        price: price,
                        dateFrom: dateFrom,
                        dateTo: dateTo,
                        timeFrom: timeFrom,
                        timeTo: timeTo));
                  }

                  Navigator.of(context).pushNamedAndRemoveUntil(
                      'processResponseAddBooking', (route) => false);
                },
                style: button_style(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  NeumorphicStyle button_style() {
    return NeumorphicStyle(
      depth: 1.5,
      intensity: 0.8,
      shadowLightColor: const Color.fromRGBO(255, 0, 0, 1),
      oppositeShadowLightSource: true,
      shape: NeumorphicShape.convex,
      boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(0),
        bottomLeft: Radius.circular(0),
        bottomRight: Radius.circular(20),
      )),
    );
  }
}

class DateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  final Function(String) function;
  final String label;

  // constructor
  DateField({Key? key, required this.function, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: [
          SizedBox(width: g.height * 0.06),
          Expanded(
            child: DateTimeField(
              onChanged: (value) {
                if (value != null) {
                  function(value.toString().substring(0, 10));
                }
              },
              onSaved: (newValue) {
                print(BlocProvider.of<BookingBloc>(context).state);
              },
              decoration: InputDecoration(
                labelText: label,
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white10,
                icon: Icon(
                  Icons.calendar_today_rounded,
                  color: Colors.grey,
                ),
              ),
              format: format,
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    helpText: 'SELECCIONAR DÍA',
                    cancelText: 'CANCELAR',
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.dark().copyWith(
                          timePickerTheme: const TimePickerThemeData(
                              backgroundColor: Colors.blue),
                          colorScheme: const ColorScheme.dark(
                            primary: Color(0xffE10B17),
                            onPrimary: Colors.white,
                            surface: g.background,
                            onSurface: Colors.white,
                          ),
                          dialogBackgroundColor: g.background,
                        ),
                        child: child!,
                      );
                    });
              },
            ),
          ),
          SizedBox(
            width: g.width * 0.17,
          ),
        ],
      ),
    ]);
  }
}

class ClockPicker extends StatelessWidget {
  final format = DateFormat("HH:mm");
  final Function(String) function;
  final String label;

  // constructor
  ClockPicker({
    Key? key,
    required this.function,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: [
          SizedBox(width: g.height * 0.06),
          Expanded(
            child: DateTimeField(
              onChanged: (value) {
                if (value != null) {
                  function(value.toString().substring(11, 16));
                  print(value);
                }
              },
              onSaved: (newValue) {
                print(BlocProvider.of<BookingBloc>(context).state);
              },
              decoration: InputDecoration(
                labelText: label,
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white10,
                icon: Icon(
                  Icons.access_time,
                  color: Colors.grey,
                ),
              ),
              format: format,
              onShowPicker: (context, currentValue) async {
                final time = await showTimePicker(
                    context: context,
                    initialTime:
                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                    helpText: 'SELECCIONAR HORA',
                    cancelText: 'CANCELAR',
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.dark().copyWith(
                          timePickerTheme: TimePickerThemeData(
                              backgroundColor: g.background),
                          colorScheme: ColorScheme.dark(
                            primary: const Color(0xffE10B17),
                          ),
                        ),
                        child: child!,
                      );
                    });
                return DateTimeField.convert(time);
              },
            ),
          ),
          SizedBox(width: g.width * 0.17),
        ],
      ),
    ]);
  }
}

class PriceField extends StatelessWidget {
  final Function(String) function;
  final String label;

  // constructor
  PriceField({Key? key, required this.function, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: [
          SizedBox(width: g.width * 0.1),
          Expanded(
            child: FormField(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white10,
                    icon: Icon(
                      Icons.attach_money,
                      color: Colors.grey,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          onSaved: (newValue) {
                            print(BlocProvider.of<BookingBloc>(context).state);
                          },
                          onChanged: (value) {
                            if (value != null) {
                              function(value);
                            }
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white10,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: g.width * 0.17,
          ),
        ],
      ),
    ]);
  }
}
