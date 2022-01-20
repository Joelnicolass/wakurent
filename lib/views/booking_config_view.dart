import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/helpers/process_response.dart';
import 'package:walkiler/routes/selectors/process_request_get_wakure.dart';
import 'package:walkiler/views/my_wakures_view.dart';
import 'package:walkiler/widgets/booking_form.dart';

import 'package:walkiler/globals.dart' as g;
import 'package:walkiler/widgets/wakure_crud_menu.dart';

class BookingConfig_View extends StatefulWidget {
  const BookingConfig_View({Key? key}) : super(key: key);

  @override
  State<BookingConfig_View> createState() => _BookingConfig_ViewState();
}

class _BookingConfig_ViewState extends State<BookingConfig_View> {
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
          children: [
            const SizedBox(height: 20),
            Center(
                child: Text(
              'Reserva',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            )),
            SizedBox(height: 50),
            DateTimeForm()
          ],
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
                  .pushNamedAndRemoveUntil('misWakure_view', (route) => false);
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
