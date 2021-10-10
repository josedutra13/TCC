import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({ Key? key }) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  //define a posição inicial do mapa
 static const _initialCameraPosition = CameraPosition(
  target: LatLng(37.773972, -122.431297),
  zoom: 11.5);

  late GoogleMapController _googleMapController;
  Marker? _request;
  BitmapDescriptor? myIcon;

  @override
  void initState() {
    
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48,48)), 'assets/logo.png').then((value){
        if(value != null){
         myIcon = value;
        }
      });
      super.initState();
  }

  @override
  void dispose(){
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: true,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) => _googleMapController = controller,
        markers: {
           if(_request != null) _request!
        },
        onLongPress: _addMarker,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition)),
        child: const Icon(Icons.center_focus_strong),
      )
    );
  }
  
  //Metodo que setta o marcador no mapa
  void _addMarker(LatLng pos) {
    if(_request == null){
      setState(() {
        _request = Marker(
          markerId: const MarkerId('request'),
          infoWindow: const InfoWindow(title: 'RESGATE'),
          icon: myIcon!,
          position: pos
        );
      });
    }
  }
}