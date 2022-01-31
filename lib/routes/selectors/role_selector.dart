import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/helpers/secure_storage.dart';
import 'package:walkiler/views/menu_view.dart';
import '../../globals.dart' as g;

class RoleSelector extends StatelessWidget {
  const RoleSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SecureStorage.getToken().then((token) {
      print(token);
    });

    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          switch (state.user!.role) {
            case "OWNER":
              //navigator to menu_view
              return Menu_View();

            case "CLIENT":
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Bienvenido/a"),
                      SizedBox(height: 20),
                      NeumorphicButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: g.width * 0.1,
                          vertical: g.height * 0.015,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'addWakure_view');
                        },
                        style: NeumorphicStyle(
                          depth: 1.5,
                          intensity: 0.8,
                          shadowLightColor: const Color.fromRGBO(255, 0, 0, 1),
                          oppositeShadowLightSource: true,
                          shape: NeumorphicShape.convex,
                          boxShape: NeumorphicBoxShape.roundRect(
                              const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(25),
                          )),
                        ),
                        child: const Text(
                          'Agregar Wakure',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            default:
              return Scaffold(
                body: Center(
                  child: Text("Unknown"),
                ),
              );
          }
        },
      ),
    );
  }
}
