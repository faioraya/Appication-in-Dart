import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  //virable
  static const LatLng ssruLatLng = const LatLng(18.777282, 100.509965);
  CameraPosition cameraPosition = CameraPosition(
    target: ssruLatLng,
    zoom: 16.0,
  );

  //method
  Widget showmap() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: cameraPosition,
      onMapCreated: (GoogleMapController googleMapController){

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return showmap();
  }
}
