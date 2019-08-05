import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  //virable
  static const LatLng ssruLatLng = const LatLng(13.774836, 100.507293);
  CameraPosition cameraPosition = CameraPosition(
    target: ssruLatLng,
    zoom: 16.0,
  );

  //method
  Set<Marker> myMaker() {
    //arr
    return <Marker>[
      //can you adds
      //maker red
      Marker(
        position: ssruLatLng,
        markerId: MarkerId('idSSRU'),
      ),
    ].toSet();
  }

  Widget showmap() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: cameraPosition,
      onMapCreated: (GoogleMapController googleMapController) {},
      markers: myMaker(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return showmap();
    
  }
}
