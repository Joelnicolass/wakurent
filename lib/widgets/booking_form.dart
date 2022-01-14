import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          BasicDateField(),
          SizedBox(height: 5),
          Clock24Example(),
          SizedBox(height: 5),
          SizedBox(height: 5),
          ElevatedButton(
            child: Text('Save'),
            onPressed: () => formKey.currentState?.save(),
          ),
          ElevatedButton(
            child: Text('Reset'),
            onPressed: () => formKey.currentState?.reset(),
          ),
          ElevatedButton(
            child: Text('Validate'),
            onPressed: () => formKey.currentState?.validate(),
          ),
        ],
      ),
    );
  }
}

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: [
          SizedBox(width: 40),
          Expanded(
            child: DateTimeField(
              decoration: InputDecoration(
                labelText: 'Desde',
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

class Clock24Example extends StatelessWidget {
  final format = DateFormat("HH:mm");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: [
          SizedBox(width: 40),
          Expanded(
            child: DateTimeField(
              decoration: InputDecoration(
                labelText: 'Horario',
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
