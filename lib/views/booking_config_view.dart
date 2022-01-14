import 'package:day_picker/day_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/widgets/booking_form.dart';
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
        title: Row(
          children: [
            Icon(Icons.electric_scooter_outlined, color: Colors.grey, size: 30),
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
          ],
        ),
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
        child: bookingForm_card(),
      ),
    );
  }
}

class bookingForm_card extends StatelessWidget {
  const bookingForm_card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          children: [const SizedBox(height: 20), 
          
          Center(child: Text('Reserva', style: TextStyle(fontSize: 20, color: Colors.grey),)),
          SizedBox(height: 50),
          DateTimeForm()],
        ),
      ),
    );
  }
}
