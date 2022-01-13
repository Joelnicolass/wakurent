// ignore_for_file: annotate_overrides

import 'package:day_picker/model/day_in_week.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/globals.dart' as g;
import 'package:walkiler/widgets/no_scroll_glow.dart';

class MisWakure_View extends StatelessWidget {
  

  MisWakure_View({Key? key}) : super(key: key);

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
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Column(
        children: <Widget>[
          Text('Mis Wakure',
              style: TextStyle(fontSize: 20, color: Colors.grey)),
          SizedBox(
            height: g.height * 0.02,
          ),
          Container(
            height: g.height * 0.63,
            child: ScrollConfiguration(
              behavior: NoScrollGlow(),
              child: ListView(
                children: [
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
        style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.circle(),
            shape: NeumorphicShape.convex,
            depth: 1.5,
            intensity: 0.3),
        onPressed: () {
          Navigator.pushNamed(context, 'addWakure_view');
        },
        child: Icon(Icons.add, color: Colors.white54),
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
      margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
      onPressed: () {
        Navigator.pushNamed(context, 'bookingConfig_view');
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
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            child: Icon(Icons.electric_scooter, color: Colors.grey, size: 40),
          ),
          Text(
            'Wakure1',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
