import 'package:auresgate/app/module/request_rescue/request_rescue_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:auresgate/app/widgets/appBar_widgets.dart';
import 'package:auresgate/app/widgets/menu_side_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final RequestRescueController _requestRescueController = Get.find();
  //define a posição inicial do mapa
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(-15.777737, -47.878488), zoom: 11.5);

  late GoogleMapController _googleMapController;
  Marker? _request;
  BitmapDescriptor? myIcon;

  // @override
  // void initState() {
  //   BitmapDescriptor.fromAssetImage(
  //           ImageConfiguration(size: Size(48, 48)), 'assets/logo.png')
  //       .then((value) {
  //     if (value != null) {
  //       myIcon = value;
  //     }
  //   });
  //   super.initState();
  // }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  void onLogout() {
    Get.offAllNamed(Routes.LOGIN);
  }

  void help() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('INFORMAÇÕES'),
            content: Container(
              height: 50,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Resgates Urgentes'),
                      Icon(Icons.circle, color: Colors.red)
                    ],
                  ),
                  Row(
                    children: [
                      Text('Resgates com pouca urgência'),
                      Icon(Icons.circle, color: Colors.green)
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(
          logout: onLogout,
        ),
        appBar: AppPageBarWidget(
            onAction: help,
            title: 'AuResgate',
            titleStyle: TextStyle(fontSize: 20)),
        body: GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: true,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (controller) => _googleMapController = controller,
          markers: {if (_request != null) _request!},
          onLongPress: _addMarker,
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 300.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //TODO COLOCAR LEGENDA DE SOLICITAR RESGATE
              FloatingActionButton(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                onPressed: () {
                  _requestRescueController.marking
                      ? _googleMapController.animateCamera(
                          CameraUpdate.newCameraPosition(
                              _initialCameraPosition))
                      : Get.toNamed(Routes.REQUEST_RESCUE);
                },
                child: _requestRescueController.marking
                    ? const Icon(Icons.center_focus_strong)
                    : const Icon(
                        Icons.add,
                        size: 35,
                      ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ));
  }

  //Metodo que setta o marcador no mapa
  void _addMarker(LatLng pos) {
    if (_request == null) {
      setState(() {
        _request = Marker(
            onTap: () {},
            markerId: const MarkerId('request'),
            //TODO Definir a cor da prioridade do resgate
            infoWindow: const InfoWindow(title: 'RESGATE'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            position: pos);
      });
    }
  }
}
