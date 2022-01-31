part of 'gps_bloc.dart';

abstract class GpsEvent extends Equatable {
  const GpsEvent();

  @override
  List<Object> get props => [];
}

class GpsAndPermissionEvent extends GpsEvent {
  final bool isGpsEnabled;
  final bool isPermissionGranted;

  const GpsAndPermissionEvent(
      {required this.isGpsEnabled, required this.isPermissionGranted});

  @override
  List<Object> get props => [isGpsEnabled, isPermissionGranted];
}
