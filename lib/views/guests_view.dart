// ignore_for_file: annotate_overrides

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/globals.dart' as g;
import 'package:walkiler/helpers/process_response.dart';
import 'package:walkiler/services/services.dart';
import 'package:walkiler/widgets/no_scroll_glow.dart';

class Guests_View extends StatefulWidget {
  Guests_View({Key? key}) : super(key: key);

  @override
  State<Guests_View> createState() => _Guests_ViewState();
}

class _Guests_ViewState extends State<Guests_View> {
  
  Future<void> resFriends() async {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final friendBloc = BlocProvider.of<FriendBloc>(context);
    final httpRes = await FriendService.getFriends(authBloc.state.user!.id);

    if (httpRes != null) {
      List<dynamic> jsonList = httpRes as List;
      final friends = ProcessResponse.getFriendList(jsonList);
      friendBloc.add(OnGetFriendsEvent(friends: friends));
    }
  }

  @override
  void initState() {
    resFriends();

    super.initState();
  }

  Widget build(BuildContext context) {
    //responsive
    g.width = MediaQuery.of(context).size.width;
    g.height = MediaQuery.of(context).size.height;

    return BlocBuilder<FriendBloc, FriendState>(builder: (context, state) {
      if (state.friends.length < 1) {
        final authBloc = BlocProvider.of<AuthBloc>(context);

        return Scaffold(
          appBar: NeumorphicAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            iconTheme: const IconThemeData(
              color: Colors.grey,
            ),
          ),
          backgroundColor: NeumorphicTheme.baseColor(context),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("No tienes amigos/as registrados/as"),
                SizedBox(height: 20),
                NeumorphicButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: g.width * 0.1,
                    vertical: g.height * 0.015,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'add_guest_view');
                  },
                  style: NeumorphicStyle(
                    depth: 1.5,
                    intensity: 0.8,
                    shadowLightColor: const Color.fromRGBO(255, 0, 0, 1),
                    oppositeShadowLightSource: true,
                    shape: NeumorphicShape.convex,
                    boxShape:
                        NeumorphicBoxShape.roundRect(const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(25),
                    )),
                  ),
                  child: const Text(
                    'Agregar Invitado/a',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
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
          backgroundColor: NeumorphicTheme.baseColor(context),
          body: Column(
            children: <Widget>[
              const Text('Invitados',
                  style: TextStyle(fontSize: 20, color: Colors.grey)),
              SizedBox(
                height: g.height * 0.02,
              ),
              SizedBox(
                height: g.height * 0.80,
                child: ScrollConfiguration(
                  behavior: NoScrollGlow(),
                  child: ListView.builder(
                      itemCount: state.friends.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        final item = state.friends[index].id.toString();

                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            // Remove the item from the data source.
                            setState(() {
                              //on event
                              final authBloc =
                                  BlocProvider.of<AuthBloc>(context);
                              final friendBloc =
                                  BlocProvider.of<FriendBloc>(context);
                              //     friendBloc.add(ProcessRequestFriendEvent());
                              friendBloc.add(DeleteFriendEvent(
                                  userId: authBloc.state.user!.id,
                                  friendId: state.friends[index].id));
                              state.friends.removeAt(index);
                            });
                          },
                          child: guest_card(
                            friendName: state.friends[index].name.toString(),
                            friendSurname:
                                state.friends[index].surname.toString(),
                            friendEmail: state.friends[index].email.toString(),
                            friendAddress:
                                state.friends[index].address.toString(),
                            friendPhone: state.friends[index].phone.toString(),
                          ),
                        );
                      }),
                ),
              ),
              const SizedBox(height: 20),
              // NeumorphicButton(
              //   margin:
              //       const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
              //   onPressed: () {},
              //   style: NeumorphicStyle(
              //       depth: 1.5,
              //       intensity: 0.3,
              //       oppositeShadowLightSource: true,
              //       shape: NeumorphicShape.convex,
              //       boxShape: NeumorphicBoxShape.roundRect(
              //           BorderRadius.circular(25))),
              //   child: const Text('Ver solicitudes',
              //       style: TextStyle(fontSize: 18, color: Colors.white)),
              // )
            ],
          ),
          floatingActionButton: NeumorphicFloatingActionButton(
            style: const NeumorphicStyle(
                boxShape: NeumorphicBoxShape.circle(),
                shape: NeumorphicShape.convex,
                depth: 1.5,
                intensity: 0.3),
            onPressed: () {
              Navigator.pushNamed(context, 'add_guest_view');
            },
            child: const Icon(Icons.add, color: Colors.white54),
          ),
        );
      }
    });
  }
}

class guest_card extends StatelessWidget {
  const guest_card({
    Key? key,
    required this.friendName,
    required this.friendSurname,
    required this.friendEmail,
    required this.friendAddress,
    required this.friendPhone,
  }) : super(key: key);

  final String friendName;
  final String friendSurname;
  final String friendEmail;
  final String friendAddress;
  final String friendPhone;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: NeumorphicButton(
        margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
        onPressed: () {
          Navigator.pushNamed(context, 'guestInfo_view', arguments: {
            "name": friendName,
            "surname": friendSurname,
            "email": friendEmail,
            "address": friendAddress,
            "phone": friendPhone,
          });
        },
        style: NeumorphicStyle(
          depth: 1.5,
          intensity: 1,
          shadowLightColor: Color.fromRGBO(255, 0, 0, 1),
          oppositeShadowLightSource: true,
          shape: NeumorphicShape.convex,
          boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(25),
          )),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: Icon(Icons.person, color: Colors.grey, size: 35),
            ),
            Text(
              friendName + ' ' + friendSurname,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
