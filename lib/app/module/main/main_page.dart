import 'package:auresgate/app/module/login/login_controller.dart';
import 'package:auresgate/app/module/request_rescue/request_rescue_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:auresgate/app/widgets/appBar_widgets.dart';
import 'package:auresgate/app/widgets/menu_side_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final RequestRescueController _requestRescueController = Get.find();
  final LoginController _loginController = Get.find();
  //define a posição inicial do mapa
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(-15.777737, -47.878488), zoom: 11.5);

  late GoogleMapController _googleMapController;
  Marker? _request;
  BitmapDescriptor? myIcon;
  List<LatLng> tappedPoints = [];

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
    // bool tem = false;
    var markers = tappedPoints.map((latlng) {
      return Marker(
          onTap: () {},
          markerId: const MarkerId('request'),
          //TODO Definir a cor da prioridade do resgate
          infoWindow: const InfoWindow(title: 'RESGATE'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position: latlng);
    }).toSet();
    return Scaffold(
        drawer: NavDrawer(
          userName: _loginController.usuarioText.text,
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
          markers: markers,
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //TODO COLOCAR LEGENDA DE SOLICITAR RESGATE
                  Visibility(
                    visible: _loginController.userDto.isPerson!,
                    child: FloatingActionButton(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      onPressed: () {
                        Get.toNamed(Routes.REQUEST_RESCUE);
                      },
                      child: const Icon(
                        Icons.add,
                        size: 35,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FloatingActionButton(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      onPressed: () {
                        _googleMapController.animateCamera(
                            CameraUpdate.newCameraPosition(
                                _initialCameraPosition));
                      },
                      child: const Icon(
                        Icons.center_focus_strong,
                        size: 30,
                      ))
                ],
              ),
            ],
          ),
        ));
  }
}
