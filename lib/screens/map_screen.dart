import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart' as lottie;
import 'package:walkiler/helpers/process_response.dart';

import 'package:walkiler/services/wakure_service.dart';
import 'package:walkiler/views/map_view.dart';
import '../blocs/blocs.dart';

import '../globals.dart' as g;

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LocationBloc locationBloc;

  Future<void> addMarker() async {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final httpRes = await WakureService.getWakures(authBloc.state.user!.id);
    List<dynamic> jsonList = httpRes as List;
    final wakures = ProcessResponse.getWakureList(jsonList);
    mapBloc.add(
      AddMarkerEvent(wakures),
    );
  }

  Timer? timer;
  @override
  void initState() {
    super.initState();
    locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.startFollowingUser();
    timer = Timer.periodic(Duration(seconds: 10), (Timer t) => addMarker());
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state.lastKnownLocation == null) {
            return Center(
              child: lottie.Lottie.asset(
                'assets/map_anim.json',
              ),
            );
          }

          return BlocBuilder<MapBloc, MapState>(builder: (context, mapState) {
            Map<String, Marker> markers = Map.from(mapState.markers);

            return SingleChildScrollView(
              child: Stack(
                children: [
                  MapView(
                    initialLocation: state.lastKnownLocation!,
                    markers: markers.values.toSet(),
                  ),
                  Positioned(
                    top: 30,
                    left: 10,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey.shade900,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ),
                  //TODO eliminar esto
                  //create blocbuilder for show markers
                  BlocBuilder<WakureBloc, WakureState>(
                    builder: (context, state) {
                      if (state.wakures.length == 0) {
                        return Container();
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            );
          });
        },
      ),
    );
  }
}
