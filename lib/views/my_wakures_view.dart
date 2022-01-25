// ignore_for_file: annotate_overrides
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/globals.dart' as g;
import 'package:walkiler/helpers/process_response.dart';
import 'package:walkiler/services/services.dart';
import 'package:walkiler/widgets/no_scroll_glow.dart';

class MisWakure_View extends StatefulWidget {
  MisWakure_View({
    Key? key,
  }) : super(key: key);

  @override
  State<MisWakure_View> createState() => _MisWakure_ViewState();
}

class _MisWakure_ViewState extends State<MisWakure_View> {
  Future<void> resWakures() async {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final wakureBloc = BlocProvider.of<WakureBloc>(context);
    final httpRes = await WakureService.getWakures(authBloc.state.user!.id);
    List<dynamic> jsonList = httpRes as List;
    final wakures = ProcessResponse.getWakureList(jsonList);
    wakureBloc.add(OnGetWakuresEvent(wakures: wakures));
  }

  @override
  void initState() {
    resWakures();
    super.initState();
  }

  Widget build(BuildContext context) {
    //responsive
    g.width = MediaQuery.of(context).size.width;
    g.height = MediaQuery.of(context).size.height;

    return BlocBuilder<WakureBloc, WakureState>(builder: (context, state) {
      if (state.wakures.length < 1) {
        final authBloc = BlocProvider.of<AuthBloc>(context);

        return Scaffold(
          appBar: NeumorphicAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('role_selector', (route) => false);
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
                Text("No tiene Wakures registrados"),
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
                    boxShape:
                        NeumorphicBoxShape.roundRect(const BorderRadius.only(
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
      } else {
        return Scaffold(
          appBar: NeumorphicAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('role_selector', (route) => false);
              },
            ),
            iconTheme: const IconThemeData(
              color: Colors.grey,
            ),
          ),
          backgroundColor: NeumorphicTheme.baseColor(context),
          body: Column(
            children: <Widget>[
              const Text('Mis Wakure',
                  style: TextStyle(fontSize: 20, color: Colors.grey)),
              SizedBox(
                height: g.height * 0.02,
              ),
              SizedBox(
                height: g.height * 0.63,
                child: ScrollConfiguration(
                    behavior: NoScrollGlow(),
                    //TODO
                    child: ListView.builder(
                        itemCount: state.wakures.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return wakure_card(
                            wakureName: state.wakures[index].name.toString(),
                            wakureId: state.wakures[index].wakureId,
                          );
                        })),
              )
            ],
          ),
          floatingActionButton: NeumorphicFloatingActionButton(
            style: const NeumorphicStyle(
                boxShape: NeumorphicBoxShape.circle(),
                shape: NeumorphicShape.convex,
                depth: 1.5,
                intensity: 0.3),
            onPressed: () {
              Navigator.pushNamed(context, 'addWakure_view');
            },
            child: const Icon(Icons.add, color: Colors.white54),
          ),
        );
      }
    });
  }
}

class wakure_card extends StatelessWidget {
  const wakure_card({
    Key? key,
    required this.wakureName,
    required this.wakureId,
  }) : super(key: key);

  final String wakureId;
  final String wakureName;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
      onPressed: () {
        Navigator.pushNamed(context, 'bookingConfig_view', arguments: {
          "title": wakureName,
          "wakureId": wakureId,
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
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            child: Icon(Icons.electric_scooter, color: Colors.grey, size: 40),
          ),
          Text(
            wakureName,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
