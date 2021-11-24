import 'dart:async';
import 'dart:io';

import 'package:auresgate/app/data/models/chamado_model.dart';
import 'package:auresgate/app/data/repository/chamado_repository.dart';
import 'package:auresgate/app/module/login/login_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class MainController extends GetxController {
  final ChamadoRepository _chamadoRepository;
  LoginController _loginController = Get.find();

  Rx<LatLng> center = LatLng(-15.777737, -47.878488).obs;
  Completer<GoogleMapController> gmapController = Completer();
  LatLng? lastMapPosition;
  Position? currentLocation;
  Set<Marker> markers = {};
  late GoogleMapController googleMapController;

  final listChamadosRescue = <Chamado>[].obs;

  final _isEmptyMarker = true.obs;
  bool get isEmptyMarker => _isEmptyMarker.value;
  set isEmptyMarker(bool value) => _isEmptyMarker.value = value;

  final _isPickTaked = false.obs;
  bool get isPickTaked => _isPickTaked.value;
  set isPickTaked(bool value) => _isPickTaked.value = value;

  final _image = File('').obs;
  File get image => _image.value;
  set image(File value) => _image.value = value;

  MainController(this._chamadoRepository);

  @override
  void onInit() {
    // getUserLocation();
    loadData();

    super.onInit();
  }

  void loadData() async {
    loadRescueChamado();

    print('loadData');
  }

  void onMapCreated(GoogleMapController controller) {
    gmapController.complete(controller);
  }

  bool checkUser() {
    var idUserCreate;
    for (var i = 0; i < listChamadosRescue.length; i++) {
      idUserCreate = listChamadosRescue[0].usuario_abriu_chamado!.id;
    }
    if (_loginController.userDto.id == idUserCreate) {
      return true;
    } else {
      return false;
    }
  }

  void onCameraMove(CameraPosition position) {
    lastMapPosition = position.target;
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    center.value =
        LatLng(currentLocation!.latitude, currentLocation!.longitude);
    print('center $center');
  }

  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void loadMarkers() {
    if (listChamadosRescue.length > 0) {
      listChamadosRescue.forEach((e) {
        if (e.status == 'FINALIZADO') {
          markers = {};
        } else {
          markers.add(
            Marker(
                markerId: MarkerId(e.id.toString()),
                position: LatLng(
                  e.animal!.localizacao!.latitude!,
                  e.animal!.localizacao!.longitude!,
                ),
                infoWindow: InfoWindow(
                  onTap: () {},
                ),
                icon: e.status == 'ANDAMENTO'
                    ? BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueOrange)
                    : BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueRed),
                onTap: () {
                  if (e.usuario_abriu_chamado!.id ==
                      _loginController.userDto.id) {
                    Get.offNamed(Routes.EDIT_RESCUE,
                        parameters: {'id': e.id.toString()});
                  } else if (e.status == 'ANDAMENTO') {
                    Get.offNamed(Routes.FINISH_RESCUE,
                        parameters: {'id': e.id.toString()});
                  } else {
                    print('STATUS AQUI : ${e.status}');
                    Get.offNamed(Routes.RESCUE,
                        parameters: {'id': e.id.toString()});
                  }
                }),
          );
        }
      });
    }
  }

  void loadRescueChamado() async {
    _isEmptyMarker.value = true;
    listChamadosRescue.assignAll(await _chamadoRepository.listChamado());
    if (listChamadosRescue.length == 0) {
      _isEmptyMarker.value = false;
    }
    loadMarkers();
  }

// CAMERA FUNCTIONS //
  Future pickImage(ImageSource source) async {
    try {
      _isPickTaked.value = false;
      final imageF = await ImagePicker().pickImage(source: source);
      if (imageF == null) return;

      final imageTemporary = File(imageF.path);
      _image.value = imageTemporary;
      _isPickTaked.value = true;
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }
}
