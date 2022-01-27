part of 'map_bloc.dart';

class MapState extends Equatable {
  // arguments

  final bool isMapInitialized;
  final bool followUser;

  final Map<String, Marker> markers;

  // constructor
  MapState({
    this.isMapInitialized = false,
    this.followUser = false,
    Map<String, Marker>? markers,
  }) : markers = markers ?? {};

  //copyWith

  MapState copyWith({
    bool? isMapInitialized,
    bool? followUser,
    Map<String, Marker>? markers,
  }) {
    return MapState(
      isMapInitialized: isMapInitialized ?? this.isMapInitialized,
      followUser: followUser ?? this.followUser,
      markers: markers ?? this.markers,
    );
  }

  @override
  List<Object> get props => [isMapInitialized, followUser, markers];
}
