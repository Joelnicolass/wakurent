import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/views/mis_wakure_view.dart';
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
                    Text('Selected: Edit');
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
              wakureBloc.add(DeleteWakureEvent(
                  id: idWakure, user_id: authBloc.state.user!.id));

              wakureBloc.add(
                  RemoveWakureEvent(id: wakureBloc.state.wakures[0].wakureId));

              Navigator.popAndPushNamed(context, 'misWakure_view');
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
