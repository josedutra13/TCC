import 'dart:async';
import 'dart:io';

import 'package:auresgate/app/data/models/chamado_model.dart';
import 'package:auresgate/app/data/repository/chamado_repository.dart';
import 'package:auresgate/app/module/login/login_controller.dart';
import 'package:auresgate/app/module/request_rescue/request_rescue_controller.dart';
import 'package:auresgate/app/module/rescue/rescue_controller.dart';
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

  final _teste = false.obs;
  bool get teste => _teste.value;
  set teste(bool value) => _teste.value = value;

  final _image = File('').obs;
  File get image => _image.value;
  set image(File value) => _image.value = value;

  MainController(this._chamadoRepository);

  @override
  void onInit() {
    // getUserLocation();
    loadData();
    funcTeste();
    super.onInit();
  }

  void loadData() async {
    loadRescueChamado();

    print('loadData');
  }

  void funcTeste() {
    for (int i = 0; i < listChamadosRescue.length; i++) {
      if (listChamadosRescue[i].status == 'EM ANDAMENTO') {
        _teste.value = true;
      } else {
        _teste.value = false;
      }
    }
  }

  void onMapCreated(GoogleMapController controller) {
    gmapController.complete(controller);
  }

  bool checkUser() {
    var idUserCreate;
    for (var i = 0; i < listChamadosRescue.length; i++) {
      idUserCreate = listChamadosRescue[0].usuario_abriu_chamado!.id;
    }
    print('ID  AQUI $idUserCreate');
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
    print('teste $teste');
    if (listChamadosRescue.length > 0) {
      listChamadosRescue.forEach((e) {
        markers.add(
          Marker(
              markerId: MarkerId(e.id.toString()),
              position: LatLng(
                e.animal!.localizacao!.latitude!,
                e.animal!.localizacao!.longitude!,
              ),
              infoWindow: InfoWindow(
                title: e.animal!.estado,
                snippet: e.animal!.estado,
                onTap: () {
                  print('Chamado clicado ID ${e.id}');
                },
              ),
              icon: teste
                  ? BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueOrange)
                  : BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed),
              onTap: () {
                if (checkUser()) {
                  Get.offNamed(Routes.EDIT_RESCUE,
                      parameters: {'id': e.id.toString()});
                } else {
                  Get.offNamed(Routes.RESCUE,
                      parameters: {'id': e.id.toString()});
                }
                print('CLICADO PAE ${e.id}');
              }),
        );
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
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      _image.value = imageTemporary;
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }
}
