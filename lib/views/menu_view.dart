import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/globals.dart' as g;
import 'package:walkiler/views/misWakure_view.dart';

class Menu_View extends StatelessWidget {
  Menu_View({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    //responsive
    g.width = MediaQuery.of(context).size.width;
    g.height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                _menuCard(labelName: "Mis Wakure", icon: Icons.electric_scooter),
                _menuCard(labelName: "Invitados", icon: Icons.groups),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                _menuCard(labelName: "Mapa", icon: Icons.location_pin),
                _menuCard(labelName: "Reservas", icon: Icons.date_range_outlined)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _menuCard extends StatelessWidget {
  const _menuCard({
    Key? key,
    required this.icon,
    required this.labelName,
  }) : super(key: key);

  final IconData icon;
  final String labelName;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
        margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
        padding: EdgeInsets.symmetric(
            horizontal: g.width * 0.1, vertical: g.height * 0.05),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MisWakure_View()));
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
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: Icon(icon, color: Colors.grey, size: 40),
            ),
            Text(
              labelName,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ));
  }
}
