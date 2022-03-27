import 'package:auresgate/app/module/edit_rescue/widgets/button_edit_widget.dart';
import 'package:auresgate/app/module/login/login_controller.dart';
import 'package:auresgate/app/module/main/main_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:auresgate/app/widgets/appBar_widgets.dart';
import 'package:auresgate/app/widgets/menu_side_widget.dart';
import 'package:auresgate/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class MainPage extends GetView<MainController> {
  MainPage({Key? key}) : super(key: key);
  void onLogout() {
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(
        userName: controller.userDto.nome!,
        onHistory: () =>
            Get.offNamed(Routes.STORY, arguments: controller.userDto),
        logout: onLogout,
      ),
      appBar: AppPageBarWidget(
        title: 'AuResgate',
        isMenu: true,
        onAction: () => controller.loadRescueChamado(),
      ),
      body: Stack(children: [
        Obx(() => Visibility(
              visible: controller.listChamadosRescue.length >= 0,
              child: GoogleMap(
                markers: controller.isEmptyMarker
                    ? Set()
                    : Set.of(controller.markers),
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
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: SpeedDial(
          visible: controller.userDto.isPerson!,
          backgroundColor: MainColors.primaryColor,
          icon: Icons.add,
          activeIcon: Icons.close,
          children: [
            SpeedDialChild(
                child: SvgPicture.asset(
                  'assets/icons/collections.svg',
                  height: 20,
                  width: 20,
                ),
                backgroundColor: MainColors.primaryColor,
                onTap: () {
                  controller.pickImage(ImageSource.gallery).then((value) {
                    if (controller.image.path != '') {
                      Get.toNamed(Routes.REQUEST_RESCUE);
                    } else {
                      Get.toNamed(Routes.MAIN);
                    }
                  });
                }),
            SpeedDialChild(
              child: SvgPicture.asset(
                'assets/icons/photo_camera.svg',
                height: 20,
                width: 20,
              ),
              backgroundColor: MainColors.primaryColor,
              onTap: () {
                controller.pickImage(ImageSource.camera).then((value) {
                  if (controller.image.path != '') {
                    Get.toNamed(Routes.REQUEST_RESCUE);
                  } else {
                    Get.toNamed(Routes.MAIN);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );

    //
  }
}
