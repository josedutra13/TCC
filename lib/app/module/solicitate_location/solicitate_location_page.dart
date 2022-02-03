import 'package:auresgate/app/module/edit_rescue/edit_rescue_controller.dart';
import 'package:auresgate/app/module/login/login_controller.dart';
import 'package:auresgate/app/module/request_rescue/request_rescue_controller.dart';
import 'package:auresgate/app/module/solicitate_location/solicitate_location_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:auresgate/app/widgets/appBar_widgets.dart';
import 'package:auresgate/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//TODO REFAZER ISSO COMO UM STATELESS WIDGET
class SolicitateLocationPage extends GetView<SolicitateLocationController> {
  const SolicitateLocationPage({Key? key}) : super(key: key);

  // @override
  // void dispose() {
  //   _googleMapController.dispose();
  //   super.dispose();
  // }

  void help(context) {
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
        appBar: AppPageBarWidget(
            title: 'Auresgate',
            onAction: () {
              help(context);
            }),
        body: Obx(
          () => GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: true,
            initialCameraPosition:
                CameraPosition(target: controller.center.value, zoom: 14.0),
            onMapCreated: controller.onMapCreated,
            markers: controller.markerd(),
            onTap: (LatLng) => controller.handleTap(context, LatLng),
          ),
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
                    child: FloatingActionButton(
                      backgroundColor: MainColors.primaryColor,
                      foregroundColor: Colors.white,
                      onPressed: () {
                        controller.googleMapController.animateCamera(
                            CameraUpdate.newCameraPosition(CameraPosition(
                                target: controller.center.value, zoom: 14.0)));
                      },
                      child: const Icon(Icons.center_focus_strong),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
