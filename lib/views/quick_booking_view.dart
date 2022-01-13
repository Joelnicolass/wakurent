import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../globals.dart' as g;

class QuickBooking_View extends StatelessWidget {
  const QuickBooking_View({Key? key}) : super(key: key);

  @override
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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: const [
            Text("Reserva Rápida",
                style: TextStyle(fontSize: 20, color: Colors.grey)),
            SizedBox(
              height: 20,
            ),
            add_guest_form(),
          ],
        ),
      ),
    );
  }
}

class add_guest_form extends StatefulWidget {
  const add_guest_form({
    Key? key,
  }) : super(key: key);

  @override
  State<add_guest_form> createState() => _add_guest_formState();
}

class _add_guest_formState extends State<add_guest_form> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: g.width * 0.8,
      height: g.height * 0.7,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 5),
              child: TextField(
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  fillColor: g.rojo,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: g.rojo,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: g.rojo,
                      width: 2,
                    ),
                  ),
                  hintText: 'Nombre',
                  hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              child: TextField(
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  fillColor: g.rojo,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: g.rojo,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: g.rojo,
                      width: 2,
                    ),
                  ),
                  hintText: 'Apellido',
                  hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              child: TextField(
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  fillColor: g.rojo,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: g.rojo,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: g.rojo,
                      width: 2,
                    ),
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              child: TextField(
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  fillColor: g.rojo,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: g.rojo,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: g.rojo,
                      width: 2,
                    ),
                  ),
                  hintText: 'Contraseña',
                  hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              child: TextField(
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  fillColor: g.rojo,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: g.rojo,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: g.rojo,
                      width: 2,
                    ),
                  ),
                  hintText: 'Dirección',
                  hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              child: TextField(
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  fillColor: g.rojo,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: g.rojo,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: g.rojo,
                      width: 2,
                    ),
                  ),
                  hintText: 'Teléfono',
                  hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            NeumorphicButton(
              padding: EdgeInsets.symmetric(
                horizontal: g.width * 0.2,
                vertical: g.height * 0.015,
              ),
              onPressed: () {},
              style: NeumorphicStyle(
                depth: 1.5,
                intensity: 0.8,
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
              child: const Text(
                'Aceptar',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(height: 5)
          ],
        ),
      ),
    );
  }
}
