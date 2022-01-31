import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/blocs.dart';

import 'package:walkiler/globals.dart' as g;
import 'package:walkiler/widgets/daypicker.dart';
import 'package:walkiler/widgets/wakure_crud_menu.dart';

class WakureInfo_View extends StatefulWidget {
  const WakureInfo_View({Key? key}) : super(key: key);

  @override
  State<WakureInfo_View> createState() => _WakureInfo_ViewState();
}

class _WakureInfo_ViewState extends State<WakureInfo_View> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    // get arguments to previous view
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    //responsive
    g.width = MediaQuery.of(context).size.width;
    g.height = MediaQuery.of(context).size.height;

    final wakureBloc = BlocProvider.of<WakureBloc>(context);

    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Row(
          children: [
            Icon(Icons.electric_scooter_outlined, color: Colors.grey, size: 30),
            const SizedBox(width: 10),
            Text(args['title'],
                style: TextStyle(fontSize: 18, color: Colors.grey)),
            PopupMenuButton<IconMenu>(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              onSelected: (value) {
                switch (value) {
                  case IconsMenu.edit:
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPopupDialogForm(context, args['wakureId']),
                    );
                    break;
                  case IconsMenu.delete:
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => _buildPopupDialog(
                        context,
                        args['wakureId'],
                      ),
                    );
                    break;
                }
              },
              itemBuilder: (context) => IconsMenu.items
                  .map((item) => PopupMenuItem<IconMenu>(
                        value: item,
                        child: ListTile(
                            leading: Icon(item.icon), title: Text(item.text)),
                      ))
                  .toList(),
            )
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            // back to previous page cleaning context
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: wakure_info_card(
          wakureId: args['wakureId'],
        ),
      ),
    );
  }
}

class wakure_info_card extends StatelessWidget {
  String wakureId;

  wakure_info_card({Key? key, required this.wakureId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookingBloc = BlocProvider.of<BookingBloc>(context);
    bookingBloc.add(ProcessRequest(state: true));

    return Container(
      width: g.width * 0.9,
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 22.0),
                      child: Text(
                        'Días habilitados',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                    DayPicker_View(
                      wakureId: wakureId,
                    ),
                  ],
                )),
                const SizedBox(height: 50),
                NeumorphicButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: g.width * 0.05,
                    vertical: g.height * 0.015,
                  ),
                  onPressed: () {
                    final bookingBloc = BlocProvider.of<BookingBloc>(context);
                    final days = bookingBloc.state.selectedDays;
                    final authBloc = BlocProvider.of<AuthBloc>(context);
                    final userId = authBloc.state.user!.id;
                    bookingBloc.add(SaveAvailableDaysEvent(
                        days: days, wakureId: wakureId, userId: userId));
                  },
                  style: NeumorphicStyle(
                    depth: 1.5,
                    intensity: 0.8,
                    shadowLightColor: const Color.fromRGBO(255, 0, 0, 1),
                    oppositeShadowLightSource: true,
                    shape: NeumorphicShape.convex,
                    boxShape:
                        NeumorphicBoxShape.roundRect(const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(25),
                    )),
                  ),
                  child: Container(
                    width: g.width * 0.28,
                    child: const Center(
                      child: Text(
                        'CONFIRMAR',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                NeumorphicButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: g.width * 0.05,
                    vertical: g.height * 0.015,
                  ),
                  onPressed: () {},
                  style: NeumorphicStyle(
                    depth: 1.5,
                    intensity: 0.8,
                    shadowLightColor: const Color.fromRGBO(255, 0, 0, 1),
                    oppositeShadowLightSource: true,
                    shape: NeumorphicShape.convex,
                    boxShape:
                        NeumorphicBoxShape.roundRect(const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(25),
                    )),
                  ),
                  child: Container(
                    width: g.width * 0.28,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Ir al mapa',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.location_searching_rounded,
                            color: Colors.grey),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                NeumorphicButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: g.width * 0.08,
                    vertical: g.height * 0.015,
                  ),
                  onPressed: () {},
                  style: NeumorphicStyle(
                    depth: 1.5,
                    intensity: 0.8,
                    shadowLightColor: const Color.fromRGBO(255, 0, 0, 1),
                    oppositeShadowLightSource: true,
                    shape: NeumorphicShape.convex,
                    boxShape:
                        NeumorphicBoxShape.roundRect(const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(25),
                    )),
                  ),
                  child: Container(
                    width: g.width * 0.23,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Apagar',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.power_settings_new_rounded,
                            color: Colors.grey),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context, String args) {
  final String idWakure = args;

  print(args);

  return AlertDialog(
    title: const Text('Warning'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text("Confirma que desea eliminar Wakure?"),
      ],
    ),
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              final wakureBloc = BlocProvider.of<WakureBloc>(context);
              final authBloc = BlocProvider.of<AuthBloc>(context);

              wakureBloc.add(ProcessRequestEvent());

              wakureBloc.add(DeleteWakureEvent(
                  id: idWakure, user_id: authBloc.state.user!.id));

              authBloc.add(GetUserProfileEvent());

              Navigator.of(context).pushNamedAndRemoveUntil(
                  'processResponseGetWakure', (route) => false);
            },
            style: TextButton.styleFrom(primary: Colors.grey),
            child: const Text('SI'),
          ),
          SizedBox(width: 30),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(primary: Colors.grey),
            child: const Text('NO'),
          ),
        ],
      )
    ],
  );
}

// POP UP FORMred

Widget _buildPopupDialogForm(BuildContext context, String args) {
  final String idWakure = args;

  return AlertDialog(
    title: const Text('Nuevo nombre'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: g.red,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: g.red,
                width: 2,
              ),
            ),
          ),
          onChanged: (value) => g.newWakureName = value,
        ),
      ],
    ),
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              print(g.newWakureName);
              final authBloc = BlocProvider.of<AuthBloc>(context);
              final wakureBloc = BlocProvider.of<WakureBloc>(context);
              wakureBloc.add(
                EditWakureEvent(
                    wakureId: idWakure,
                    wakureName: g.newWakureName,
                    userId: authBloc.state.user!.id),
              );

              Navigator.of(context)
                  .pushNamedAndRemoveUntil('my_wakures_view', (route) => false);
            },
            style: TextButton.styleFrom(primary: Colors.grey),
            child: const Text('CONFIRMAR'),
          ),
          SizedBox(width: 30),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(primary: Colors.grey),
            child: const Text('CANCELAR'),
          ),
        ],
      )
    ],
  );
}
