import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({ Key? key }) : super(key: key);
  //posição inicial na qual o mapa estará
  static const _initialCameraPosition = 
  CameraPosition(target: LatLng(37.773972, -122.431297),zoom: 11.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition:_initialCameraPosition ,
      ),
    );
  }
}