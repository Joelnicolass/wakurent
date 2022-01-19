import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/blocs.dart';

import '../globals.dart' as g;

class AddWakure_View extends StatelessWidget {
  const AddWakure_View({Key? key}) : super(key: key);

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
            Text('Mi nuevo Wakure',
                style: TextStyle(fontSize: 20, color: Colors.grey)),
            SizedBox(
              height: 20,
            ),
            add_wakure_form(),
          ],
        ),
      ),
    );
  }
}

class add_wakure_form extends StatelessWidget {
  const add_wakure_form({
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              child: TextField(
                onChanged: (value) => g.wakureName = value,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
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
                onChanged: (value) => g.wakureCode = value,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
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
                  hintText: 'Código',
                  hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            NeumorphicButton(
              padding: EdgeInsets.symmetric(
                horizontal: g.width * 0.2,
                vertical: g.height * 0.015,
              ),
              onPressed: () {
                final wakureBloc = BlocProvider.of<WakureBloc>(context);
                wakureBloc.add(
                  SaveNewWakureEvent(
                    wakureCode: g.wakureCode,
                    wakureName: g.wakureName,
                  ),
                );
                Navigator.pushNamed(context, 'misWakure_view');
              },
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
          ],
        ),
      ),
    );
  }
}
