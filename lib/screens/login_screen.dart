import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/user/auth_bloc.dart';
import 'package:walkiler/screens/role_selector.dart';

import '../globals.dart' as g;

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //responsive
    g.width = MediaQuery.of(context).size.width;
    g.height = MediaQuery.of(context).size.height;

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.loggedIn == true) {
          return Scaffold(
            body: RoleSelector(),
          );
        } else {
          return loginView();
        }
      },
    );
  }
}

class loginView extends StatelessWidget {
  const loginView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'WAKURE',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: g.width * 0.1,
                color: g.rojo,
                shadows: [
                  Shadow(
                    color: g.rojo,
                    blurRadius: g.width * 0.05,
                    offset: Offset(g.width * 0.001, g.width * 0.001),
                  ),
                ],
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const login_form(),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          //popup
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Forgot Password'),
                content: const Text('Please contact the admin'),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Container(child: const Text('Crear una cuenta')),
      ),
    );
  }
}

class login_form extends StatelessWidget {
  const login_form({
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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                  hintText: 'Usuario',
                ),
                onChanged: (value) => g.email = value,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextField(
                obscureText: true,
                autocorrect: false,
                enableSuggestions: false,
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
                  hintText: 'Contraseña',
                ),
                onChanged: (value) => g.password = value,
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
              onPressed: () {
                final authBloc = BlocProvider.of<AuthBloc>(context);
                authBloc.add(
                  LoginEvent(
                    email: g.email,
                    password: g.password,
                  ),
                );

                //popup

                //message if not logged
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
                'Login',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
