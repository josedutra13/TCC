import 'dart:async';

import 'package:auresgate/app/module/edit_rescue/edit_rescue_controller.dart';
import 'package:auresgate/app/module/login/login_controller.dart';
import 'package:auresgate/app/module/request_rescue/request_rescue_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:auresgate/app/widgets/button_widgets.dart';
import 'package:auresgate/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SolicitateLocationController extends GetxController {
  final RequestRescueController requestRescueController = Get.find();
  final LoginController loginController = Get.find();
  final EditRescueController editRescueController = Get.find();
  late GoogleMapController googleMapController;

  Rx<LatLng> center = LatLng(-15.777737, -47.878488).obs;
  Completer<GoogleMapController> gmapController = Completer();

  final _tappedPoints = <LatLng>[].obs;
  List<LatLng> get tappedPoints => _tappedPoints;
  set tappedPoints(List<LatLng> value) => _tappedPoints;

  final _marker = Set<Marker>().obs;
  Set<Marker> get marker => _marker;
  set marker(Set<Marker> value) => _marker;

  void onLogout() {
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  void isCancel() {
    if (editRescueController.isEditing) {
      Get.offNamed(Routes.EDIT_RESCUE);
    } else {
      Get.back();
      Get.back();
    }
  }

  void confirmBotton() {
    if (editRescueController.isEditing) {
      print('CAI AQUI');
      editRescueController.onEditAnimal(
          latitude: tappedPoints[0].latitude,
          longitude: tappedPoints[0].longitude);
      Get.toNamed(Routes.EDIT_RESCUE);
    } else {
      requestRescueController
        ..onChangeSolicitation(
            latitude: tappedPoints[0].latitude,
            longitude: tappedPoints[0].longitude)
        ..onConfirmRescue();
    }
  }

  Set<Marker> markerd() {
    _marker.value = tappedPoints.map((latlng) {
      return Marker(
          onTap: () {},
          markerId: MarkerId('request'),
          //TODO Definir a cor da prioridade do resgate
          infoWindow: const InfoWindow(title: 'RESGATE'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position: latlng);
    }).toSet();

    return marker;
  }

  void onMapCreated(GoogleMapController controller) {
    gmapController.complete(controller);
    googleMapController = controller;
  }

  void handleTap(BuildContext context, LatLng latlng) {
    _tappedPoints.value = [];
    _tappedPoints.add(latlng);

    showModalBottom(context);

    print(tappedPoints);
  }

  void showModalBottom(context) => showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        builder: (content) => SizedBox(
          height: 100,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 3,
                  width: MediaQuery.of(context).size.height * 0.065,
                  color: MainColors.primaryColor,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.065,
                    child: ButtonWidget(
                      onPressed: () {
                        Get.toNamed(Routes.REQUEST_RESCUE);
                        isCancel();
                      },
                      buttonText: 'Cancelar',
                      isBack: true,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.065,
                    child: ButtonWidget(
                      onPressed: () {
                        confirmBotton();
                      },
                      buttonText: 'Confirmar',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
