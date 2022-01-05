import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:walkiler/blocs/blocs.dart';
import 'package:walkiler/themes/themes.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  //Arguements

  GoogleMapController? _mapController;
  LocationBloc? _locationBloc;

  MapBloc() : super(MapState()) {
    on<OnMapInitializedEvent>(_onInitMap);
  }

  void _onInitMap(OnMapInitializedEvent event, Emitter<MapState> emit) {
    _mapController = event.controller;

    //custom map style
    _mapController!.setMapStyle(
      jsonEncode(darkMapTheme),
    );

    emit(state.copyWith(isMapInitialized: true));
  }
}
