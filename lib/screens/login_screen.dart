import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/auth/auth_bloc.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/routes/selectors/role_selector.dart';
import 'package:lottie/lottie.dart' as lottie;

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
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child:
                      lottie.Lottie.asset('assets/map_login.json', width: 200),
                ),
                Text(
                  'WAKURENT',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: g.width * 0.1,
                    color: g.red,
                    shadows: [
                      Shadow(
                        color: g.red,
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
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state.error != null) {
                  return Positioned(
                    bottom: g.height * 0.12,
                    left: g.width * 0.1,
                    child:
                        Text(state.error!, style: TextStyle(color: Colors.red)),
                  );
                } else {
                  return const SizedBox(
                    height: 0,
                  );
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
          onTap: () {
            final userBloc = BlocProvider.of<UserBloc>(context);
            userBloc.add(ClearRegisterErrorEvent());
            Navigator.pushNamed(context, 'register_view');
          },
          child: const Text('Crear una cuenta')),
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
      height: g.height * 0.45,
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
                decoration: const InputDecoration(
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
                      color: g.red,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: g.red,
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
                g.email = "";
                g.password = "";
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
