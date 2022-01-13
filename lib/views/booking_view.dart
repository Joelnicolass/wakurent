// ignore_for_file: annotate_overrides

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/globals.dart' as g;
import 'package:walkiler/widgets/no_scroll_glow.dart';

class Booking_View extends StatelessWidget {
  Booking_View({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    //responsive
    g.width = MediaQuery.of(context).size.width;
    g.height = MediaQuery.of(context).size.height;

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
            height: g.height * 0.63,
            child: ScrollConfiguration(
              behavior: NoScrollGlow(),
              child: ListView(
                children: const [
                  wakure_card(),
                  wakure_card(),
                  wakure_card(),
                  wakure_card(),
                  wakure_card(),
                  wakure_card(),
                  wakure_card(),
                  wakure_card(),
                  wakure_card(),
                ],
              ),
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
          Navigator.pushNamed(context, 'quickBooking_view');
        },
        child: const Icon(Icons.add, color: Colors.white54),
      ),
    );
  }
}

class wakure_card extends StatelessWidget {
  const wakure_card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      onPressed: () {},
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
            children: const [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                child:
                    Icon(Icons.electric_scooter, color: Colors.grey, size: 40),
              ),
              Text(
                'Wakure1',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(
                width: 70,
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                child: Icon(Icons.person, color: Colors.grey, size: 40),
              ),
              Text(
                'Usuario1',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: const [
              Text(
                'Desde: 12/02/2021',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(
                width: 60,
              ),
              Text(
                'Hasta 13/02/2021',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
