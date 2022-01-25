import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


Future<BitmapDescriptor> getAssetImageMarker() async {

  return BitmapDescriptor.fromAssetImage(
    const ImageConfiguration(
      devicePixelRatio: 5.0,
      size: Size(50, 50) 
    ), 
    'assets/marker.png');

}