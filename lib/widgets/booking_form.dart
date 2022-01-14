import 'dart:async';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// For changing the language
//import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_cupertino_localizations/flutter_cupertino_localizations.dart';

class DateTimeForm extends StatefulWidget {
  @override
  _DateTimeFormState createState() => _DateTimeFormState();
}

class _DateTimeFormState extends State<DateTimeForm> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DateField(
            label: 'Desde',
            blocHandler: 'bookingBloc',
          ),
          SizedBox(height: 5),
          ClockPicker(label: 'Horario', blocHandler: 'bookingBloc'),
          SizedBox(height: 10),
          // separator with gradient
          Center(
            child: Container(
              height: 2,
              width: 350,
              //gradient vertical
              decoration: BoxDecoration(
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

          SizedBox(height: 10),
          DateField(
            label: 'Hasta',
            blocHandler: 'bookingBloc',
          ),
          SizedBox(height: 5),
          ClockPicker(label: 'Horario', blocHandler: 'bookingBloc'),

          // buttons
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NeumorphicButton(
                  child: Text('Reservar'),
                  onPressed: () => formKey.currentState?.save(),
                ),
                NeumorphicButton(
                  child: Text('Reset'),
                  onPressed: () => formKey.currentState?.reset(),
                ),
                NeumorphicButton(
                  child: Text('Validate'),
                  onPressed: () => formKey.currentState?.validate(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  final blocHandler;
  final String label;

  // constructor
  DateField({Key? key, required this.blocHandler, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: [
          SizedBox(width: 40),
          Expanded(
            child: DateTimeField(
              onSaved: (newValue) {
                print('onSaved: ' + newValue.toString().substring(0, 10));
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
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
              },
            ),
          ),
          SizedBox(
            width: 70,
          ),
        ],
      ),
    ]);
  }
}

class ClockPicker extends StatelessWidget {
  final format = DateFormat("HH:mm");
  final blocHandler;
  final String label;

  // constructor
  ClockPicker({Key? key, required this.blocHandler, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: [
          SizedBox(width: 40),
          Expanded(
            child: DateTimeField(
              onSaved: (newValue) {
                print('HORA: ' + newValue.toString().substring(10, 16));
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
                  builder: (context, child) => MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(alwaysUse24HourFormat: true),
                      child: child!),
                );
                return DateTimeField.convert(time);
              },
            ),
          ),
          SizedBox(width: 70),
        ],
      ),
    ]);
  }
}
