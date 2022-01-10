import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../globals.dart' as g;

class InvitadosInfo_View extends StatelessWidget {
  const InvitadosInfo_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //responsive
    g.width = MediaQuery.of(context).size.width;
    g.height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: NeumorphicAppBar(actions: []),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: guestInfo_card(),
      ),
    );
  }
}

class guestInfo_card extends StatelessWidget {
  const guestInfo_card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: g.width * 0.8,
      height: g.height * 0.6,
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  children: [
                    Icon(Icons.person, color: Colors.grey, size: 30),
                    SizedBox(width: 10),
                    Text('Pedro Equis', style: TextStyle( fontSize: 18, color: Colors.grey)),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Row(
                  children: [
                    Icon(Icons.map, color: Colors.grey, size: 30),
                    SizedBox(width: 10),
                    Text('Calle 123', style: TextStyle( fontSize: 18, color: Colors.grey)),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
              child: Row(
                  children: [
                    Icon(Icons.phone, color: Colors.grey, size: 30),
                    SizedBox(width: 10),
                    Text('3764-232545', style: TextStyle( fontSize: 18, color: Colors.grey)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
