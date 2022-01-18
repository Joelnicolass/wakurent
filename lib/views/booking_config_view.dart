import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/helpers/process_response.dart';
import 'package:walkiler/models/models.dart';
import 'package:walkiler/services/services.dart';
import 'package:walkiler/widgets/booking_form.dart';

import 'package:walkiler/globals.dart' as g;
import 'package:walkiler/widgets/wakure_crud_menu.dart';

class BookingConfig_View extends StatefulWidget {
  const BookingConfig_View({Key? key}) : super(key: key);

  @override
  State<BookingConfig_View> createState() => _BookingConfig_ViewState();
}

class _BookingConfig_ViewState extends State<BookingConfig_View> {
  Future<void> resWakures() async {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final wakureBloc = BlocProvider.of<WakureBloc>(context);
    final httpRes = await WakureService.getWakures(authBloc.state.user!.id);
    List<dynamic> jsonList = httpRes as List;
    final wakures = ProcessResponse.getWakureList(jsonList);
    wakureBloc.add(OnGetWakuresEvent(wakures: wakures));

    print(wakures[0].wakureId);
  }

  @override
  void initState() {
    resWakures();

    super.initState();
  }

  Widget build(BuildContext context) {
    //responsive
    g.width = MediaQuery.of(context).size.width;
    g.height = MediaQuery.of(context).size.height;

    return BlocBuilder<WakureBloc, WakureState>(builder: (context, state) {
      if (state.wakures.length < 1) {
        return Container(
          child: Text("cargando"),
        );
      } else {
        return Scaffold(
          appBar: NeumorphicAppBar(
            title: Row(
              children: [
                Icon(Icons.electric_scooter_outlined,
                    color: Colors.grey, size: 30),
                const SizedBox(width: 10),
                Text('Wakure 1',
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
                        final wakureBloc = BlocProvider.of<WakureBloc>(context);
                        wakureBloc.add(
                          DeleteWakureEvent(id: state.wakures[0].wakureId),
                        );
                        // TODO : HACER UN CARTEL DE SEGURO DESEA ELIMINAR WAKURE?
                        // TODO : QUE AL APRETAR EL BOTON LLEVE LA PANTALLA DE ATRAS Y SE ACTUALICE LA LISTA DE WAKURES
                        break;
                    }
                  },
                  itemBuilder: (context) => IconsMenu.items
                      .map((item) => PopupMenuItem<IconMenu>(
                            value: item,
                            child: ListTile(
                                leading: Icon(item.icon),
                                title: Text(item.text)),
                          ))
                      .toList(),
                )
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
    });
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
