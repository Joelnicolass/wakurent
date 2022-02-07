import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/globals.dart' as g;
import 'package:walkiler/helpers/process_response.dart';
import 'package:walkiler/helpers/secure_storage.dart';
import 'package:walkiler/models/ticket.dart';
import 'package:walkiler/services/booking_service.dart';
import 'package:walkiler/views/my_wakures_view.dart';

class Menu_View extends StatelessWidget {
  Menu_View({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    //responsive
    g.width = MediaQuery.of(context).size.width;
    g.height = MediaQuery.of(context).size.height;

    void goRoute(String value) {
      Navigator.pushNamed(context, value);
    }

    return Scaffold(
      appBar: NeumorphicAppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  final authBloc = BlocProvider.of<AuthBloc>(context);
                  authBloc.add(SignOutEvent());
                  authBloc.add(ClearErrorEvent());
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      'login_screen', (route) => false);
                },
                child: const Icon(Icons.logout_rounded),
              )),
        ],
      ),
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _menuCard(
                    labelName: "Reservas",
                    icon: Icons.date_range_outlined,
                    route: () => goRoute('booking_view')),
                _menuCard(
                    labelName: "Mis Wakure",
                    icon: Icons.electric_scooter,
                    route: () => goRoute('my_wakures_view')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _menuCard(
                    labelName: "Invitados",
                    icon: Icons.groups,
                    route: () => goRoute('guests_view')),
                _menuCard(
                    labelName: "Mapa",
                    icon: Icons.location_pin,
                    route: () => goRoute('loading_screen')),
              ],
              // create button for test
            ),
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
    required this.route,
  }) : super(key: key);

  final IconData icon;
  final String labelName;
  final VoidCallback route;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
        margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
        padding: EdgeInsets.symmetric(
            horizontal: g.width * 0.1, vertical: g.height * 0.05),
        onPressed: () {
          route();
        },
        style: NeumorphicStyle(
          depth: 1.5,
          intensity: 1,
          shadowLightColor: const Color.fromRGBO(255, 0, 0, 1),
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
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ));
  }
}
