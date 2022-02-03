import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/routes/selectors/role_selector.dart';
import 'package:walkiler/views/menu_view.dart';

import '../globals.dart' as g;

class AddGuest_View extends StatelessWidget {
  const AddGuest_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //responsive
    g.width = MediaQuery.of(context).size.width;
    g.height = MediaQuery.of(context).size.height;

    return BlocBuilder<FriendBloc, FriendState>(
      builder: (context, state) {
      if (state.friendCreated == true) {
        return RoleSelector();
      } else {
        return addguestView();
      }
    });
  }
}

class addguestView extends StatelessWidget {
  const addguestView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: Stack(
          children: [
            Column(
              children: const [
                Text("Nuevo Invitado",
                    style: TextStyle(fontSize: 20, color: Colors.grey)),
                SizedBox(
                  height: 20,
                ),
                add_guest_form(),
              ],
            ),
            BlocBuilder<FriendBloc, FriendState>(
              builder: (context, state) {
                if (state.error != null) {
                  print(state.error);
                  return Positioned(
                    bottom: g.height * 0.08,
                    left: g.width * 0,
                    child: Text(state.error,
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

class add_guest_form extends StatelessWidget {
  const add_guest_form({
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 5),
              child: TextField(
                onChanged: (value) => g.name = value,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  fillColor: g.red,
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
                onChanged: (value) => g.surname = value,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  fillColor: g.red,
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
                onChanged: (value) => g.email = value,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  fillColor: g.red,
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
                onChanged: (value) => g.address = value,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  fillColor: g.red,
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
                onChanged: (value) => g.phone = value,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  fillColor: g.red,
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
                  hintText: 'Teléfono',
                  hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            NeumorphicButton(
              padding: EdgeInsets.symmetric(
                horizontal: g.width * 0.2,
                vertical: g.height * 0.015,
              ),
              onPressed: () {
                final authBloc = BlocProvider.of<AuthBloc>(context);
                final friendBloc = BlocProvider.of<FriendBloc>(context);

                friendBloc.add(ProcessRequestFriendEvent());

                friendBloc.add(AddFriend(
                    userId: authBloc.state.user!.id,
                    name: g.name,
                    surname: g.surname,
                    address: g.address,
                    email: g.email,
                    password: 'WAKURECLIENT',
                    phone: g.phone));

                //reset data
                g.name = '';
                g.surname = '';
                g.address = '';
                g.email = '';
                g.password = '';
                g.phone = '';
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
            SizedBox(height: 5)
          ],
        ),
      ),
    );
  }
}
