// ignore_for_file: annotate_overrides

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/globals.dart' as g;

class Invitados_View extends StatelessWidget {
  Invitados_View({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    //responsive
    g.width = MediaQuery.of(context).size.width;
    g.height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: NeumorphicAppBar(actions: []),
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Column(
        children: <Widget>[
          Text('Invitados', style: TextStyle(fontSize: 20)),
          SizedBox(
            height: g.height * 0.02,
          ),
          Container(
            height: g.height * 0.63,
            child: ListView(
              children: [
                invitado_card(),
                invitado_card(),
                invitado_card(),
                invitado_card(),
                invitado_card(),
                invitado_card(),
                invitado_card(),
                invitado_card(),
                invitado_card(),
              ],
            ),
          ),
          SizedBox(height: 20),
          NeumorphicButton(
          margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
      onPressed: () {
        },
      style: NeumorphicStyle(
        depth: 1.5,
        intensity: 0.3,
        oppositeShadowLightSource: true,
        shape: NeumorphicShape.convex,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(25))),
            child: 
                Text('Ver solicitudes', style: TextStyle(fontSize: 20))
            )
        ],
      ),
      floatingActionButton: NeumorphicFloatingActionButton(
        style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
        shape:NeumorphicShape.convex ,
        depth: 1.5,
        intensity: 0.3
        ),
        onPressed: (){

        }, 
        child: Icon(Icons.add, color: Colors.white54),
        ),

    );
  }
}

class invitado_card extends StatelessWidget {
  const invitado_card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
      onPressed: () {
        Navigator.pushNamed(context, 'invitadosInfo_view');
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
            child: Icon(Icons.person, color: Colors.grey, size: 35),
          ),
          Text(
            'Invitado X',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(
            width: 180,
          ),
          Icon(Icons.delete, color: Colors.grey, size: 30)
        ],
      ),
    );
  }
}
