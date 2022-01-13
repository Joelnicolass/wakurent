import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:walkiler/helpers/process_response.dart';

import 'package:walkiler/services/wakure_service.dart';
import 'package:walkiler/views/map_view.dart';
import '../blocs/blocs.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LocationBloc locationBloc;

  @override
  void initState() {
    super.initState();
    locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.startFollowingUser();
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state.lastKnownLocation == null) {
            return const Center(child: const Text('Loading...'));
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
                  //crear boton
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Neumorphic(
                      style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.circle(),
                        depth: 10,
                        color: Colors.white,
                      ),
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Center(
                          child: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () async {
                              final httpRes = await WakureService.getWakures(
                                  '61d74520b26f4b6103e370bc');

                              print('boton');

                              List<dynamic> jsonList = httpRes as List;

                              final wakures =
                                  ProcessResponse.getWakureList(jsonList);

                              final mapBloc = BlocProvider.of<MapBloc>(context);
                              mapBloc.add(
                                AddMarkerEvent(wakures),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  //create blocbuilder for show markers
                  BlocBuilder<WakureBloc, WakureState>(
                    builder: (context, state) {
                      if (state.wakures.length == 0) {
                        return Container();
                      }
                      return Container(
                        child: Text('ALGO PASÓ'),
                      );
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
