import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/routes/selectors/role_selector.dart';

import '../globals.dart' as g;

class Register_View extends StatelessWidget {
  const Register_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //responsive
    g.width = MediaQuery.of(context).size.width;
    g.height = MediaQuery.of(context).size.height;

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (contextAuth, stateAuth) {
        return BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state.userCreated == true) {
              if (stateAuth.loggedIn == true) {
                return RoleSelector();
              } else {
                BlocProvider.of<AuthBloc>(contextAuth)
                    .add(LoginEvent(email: g.email, password: g.password));
                return Center(child: CircularProgressIndicator());
              }
            } else {
              return registerView();
            }
          },
        );
      },
    );
  }
}

class registerView extends StatelessWidget {
  const registerView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Registro'),
                const SizedBox(
                  height: 10,
                ),
                const addGuest_form(),
              ],
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state.error != null) {
                  print(state.error!);
                  return Positioned(
                    bottom: g.height * 0.11,
                    left: g.width * 0,
                    child: Text(state.error!,
                        style: const TextStyle(color: Colors.red)),
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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                onChanged: (value) => g.name = value,
                decoration: const InputDecoration(
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
                onChanged: (value) => g.surname = value,
                decoration: const InputDecoration(
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
                onChanged: (value) => g.email = value,
                decoration: const InputDecoration(
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
                onChanged: (value) => g.password = value,
                decoration: const InputDecoration(
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
                onChanged: (value) => g.address = value,
                decoration: const InputDecoration(
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
                onChanged: (value) => g.phone = value,
                decoration: const InputDecoration(
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
            const SizedBox(
              height: 20,
            ),
            NeumorphicButton(
              padding: EdgeInsets.symmetric(
                horizontal: g.width * 0.2,
                vertical: g.height * 0.015,
              ),
              onPressed: () {
                final userBloc = BlocProvider.of<UserBloc>(context);
                userBloc.add(
                  SaveNewUserEvent(
                    name: g.name,
                    surname: g.surname,
                    email: g.email,
                    password: g.password,
                    address: g.address,
                    phone: g.phone,
                  ),
                );
                userBloc.add(RegisterUserErrorsEvent(
                    name: g.name,
                    surname: g.surname,
                    address: g.address,
                    email: g.email,
                    password: g.password,
                    phone: g.phone));
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
