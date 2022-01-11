import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/models/wakure.dart';
import 'package:walkiler/themes/themes.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  //Arguements

  GoogleMapController? _mapController;
  LocationBloc? _locationBloc;

  MapBloc() : super(MapState()) {
    on<OnMapInitializedEvent>(_onInitMap);

    //add marker
    on<AddMarkerEvent>((_addMarker));
  }

  void _onInitMap(OnMapInitializedEvent event, Emitter<MapState> emit) {
    _mapController = event.controller;

    //custom map style
    _mapController!.setMapStyle(
      jsonEncode(darkMapTheme),
    );

    emit(state.copyWith(isMapInitialized: true));
  }

  //create multiple markers

  void _addMarker(AddMarkerEvent event, Emitter<MapState> emit) {
    //add markers

    List<Marker> listMarkers = [];

    event.wakures.forEach((wakure) {
      var marker = Marker(
        markerId: MarkerId(wakure.name),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        position: LatLng(wakure.geolocation.lat, wakure.geolocation.lng),
      );
      listMarkers = [...listMarkers, marker];
    });

    final currentMarkers = Map<String, Marker>.from(state.markers);

    listMarkers.forEach((marker) {
      currentMarkers[marker.markerId.toString()] = marker;
    });

    emit(state.copyWith(
        followUser: state.followUser,
        isMapInitialized: state.isMapInitialized,
        markers: currentMarkers));
  }
}

class NewMarker {
  static List<Marker> markers(Wakure wakure) {
    List<Marker> listMarkers = [];

    //map wakures
/*     wakure.wakures.forEach((wakure) {
      var marker = Marker(
        markerId: MarkerId(wakure.name),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        position: LatLng(wakure.geolocation.lat, wakure.geolocation.lng),
      );
      listMarkers = [...listMarkers, marker];
    }); */

    return listMarkers;
  }
}
