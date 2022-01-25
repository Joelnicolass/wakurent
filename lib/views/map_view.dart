import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:walkiler/blocs/blocs.dart';

class MapView extends StatelessWidget {
  final Set<Marker> markers;
  final LatLng initialLocation;

  const MapView(
      {Key? key, required this.initialLocation, required this.markers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mapBloc = BlocProvider.of<MapBloc>(context);

    final CameraPosition initialCameraPosition = CameraPosition(
      target: initialLocation,
      zoom: 15,
    );

    return SizedBox(
        height: size.height,
        width: size.width,
        child: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          onMapCreated: (controller) =>
              mapBloc.add(OnMapInitializedEvent(controller)),
          markers: markers,
        ));
  }
}
