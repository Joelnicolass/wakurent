import 'package:day_picker/day_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/widgets/time_picker.dart';

import 'package:walkiler/globals.dart' as g;

class BookingConfig_View extends StatelessWidget {
  const BookingConfig_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //responsive
    g.width = MediaQuery.of(context).size.width;
    g.height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: NeumorphicAppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: const Center(
        child: booking_card(),
      ),
    );
  }
}

class booking_card extends StatelessWidget {
  const booking_card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool value = false;

    final List<DayInWeek> _days = [
      DayInWeek(
        "Dom",
      ),
      DayInWeek(
        "Lun",
      ),
      DayInWeek(
        "Mar",
      ),
      DayInWeek(
        "Mie",
      ),
      DayInWeek(
        "Jue",
      ),
      DayInWeek(
        "Vie",
      ),
      DayInWeek("Sab", isSelected: true),
    ];

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
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  children: [
                    Icon(Icons.electric_scooter_outlined,
                        color: Colors.grey, size: 30),
                    const SizedBox(width: 10),
                    Text('Wakure 1',
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                    GestureDetector(
                      child: Icon(
                        Icons.more_vert,
                        color: Colors.grey,
                      ),
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 130,
                    ),
                    CupertinoSwitch(
                      activeColor: Color.fromARGB(123, 500, 30, 50),
                      value: value,
                      onChanged: (v) => setState(() => value = v),
                    ),
                  ],
                )),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SelectWeekDays(
                    daysFillColor: g.rojo,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    days: _days,
                    border: false,
                    boxDecoration: BoxDecoration(
                      color: g.background,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onSelect: (values) {
                      print(values);
                    },
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text('Desde',
                            style: TextStyle(fontSize: 18, color: Colors.grey)),
                        TimePicker()
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        const Text('Hasta',
                            style: TextStyle(fontSize: 18, color: Colors.grey)),
                        TimePicker()
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  setState(bool Function() param0) {}
}
