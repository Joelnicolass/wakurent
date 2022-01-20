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
                //responsive

                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Hola, Cliente"),
                      SizedBox(height: 20),
                      NeumorphicButton(
                          child: Text('Agregar Wakure'),
                          onPressed: () =>
                              Navigator.pushNamed(context, 'addWakure_view'))
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
