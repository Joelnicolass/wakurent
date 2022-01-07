part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnMapInitializedEvent extends MapEvent {
  final GoogleMapController controller;

  const OnMapInitializedEvent(this.controller);
}

// event for add marker
class AddMarkerEvent extends MapEvent {
  final List<LatLng> position;

  AddMarkerEvent(this.position);

  @override
  List<Object> get props => [position];
}
