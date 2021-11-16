import 'package:auresgate/app/module/login/login_controller.dart';
import 'package:auresgate/app/module/main/main_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:auresgate/app/widgets/appBar_widgets.dart';
import 'package:auresgate/app/widgets/menu_side_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainPage extends GetView<MainController> {
  final LoginController _loginController = Get.find();

  MainPage({Key? key}) : super(key: key);
  void onLogout() {
    Get.offAllNamed(Routes.LOGIN);
  }

  void reloadMarkers() {
    controller.loadRescueChamado();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(
        userName: _loginController.usuarioText.text,
        logout: onLogout,
      ),
      appBar: AppPageBarWidget(
          onAction: reloadMarkers,
          isMenu: true,
          title: 'AuResgate',
          titleStyle: TextStyle(fontSize: 20)),
      body: Stack(children: [
        Obx(() => Visibility(
              visible: controller.listChamadosRescue.length >= 0,
              child: GoogleMap(
                markers: controller.isEmptyMarker
                    ? Set.of(controller.markers)
                    : Set(),
                initialCameraPosition:
                    CameraPosition(target: controller.center.value, zoom: 14.0),
                onMapCreated: controller.onMapCreated,
                zoomGesturesEnabled: true,
                onCameraMove: controller.onCameraMove,
                myLocationEnabled: true,
                compassEnabled: false,
                myLocationButtonEnabled: true,
                mapToolbarEnabled: false,
              ),
            )),
        Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
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
                        // print(
                        //     'TESTE ${_requestRescueController.loadRescueChamado}');
                        Get.offNamed(Routes.REQUEST_RESCUE);
                      },
                      child: const Icon(
                        Icons.add,
                        size: 35,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     bottom: 23,
                  //   ),
                  //   child: FloatingActionButton(
                  //       backgroundColor: Colors.blue,
                  //       foregroundColor: Colors.white,
                  //       onPressed: () {
                  //         // _googleMapController.animateCamera(
                  //         //     CameraUpdate.newCameraPosition(
                  //         //         _initialCameraPosition));
                  //       },
                  //       child: const Icon(
                  //         Icons.center_focus_strong,
                  //         size: 30,
                  //       )),
                  // )
                ],
              ),
            ]))
      ]),
    );

    //
  }
}
