import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../globals.dart' as g;

class Register_View extends StatelessWidget {
  const Register_View({Key? key}) : super(key: key);

  @override
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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Text('Registro'),
            const SizedBox(
              height: 10,
            ),
            const addGuest_form(),
          ],
        ),
      ),
    );
  }
}

class addGuest_form extends StatelessWidget {
  const addGuest_form({
    Key? key,
  }) : super(key: key);

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
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
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextField(
                decoration: InputDecoration(
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
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
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
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
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
                  hintText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
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
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
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
                ),
              ),
            ),
            SizedBox(
              height: 20,
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
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 0.2)
          ],
        ),
      ),
    );
  }
}
