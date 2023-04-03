import 'dart:convert';
import 'dart:io';

// import 'package:dio/dio.dart' as dio;
import 'package:auresgate/app/data/models/animal_model.dart';
import 'package:auresgate/app/data/models/DTO/chamadoDTO_model.dart';
import 'package:auresgate/app/data/repository/chamado_repository.dart';
import 'package:auresgate/app/module/login/login_controller.dart';
import 'package:auresgate/app/module/main/main_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widgets/app_dependencies.dart';
// import 'package:http_parser/http_parser.dart';

class RequestRescueController extends GetxController {
  final ChamadoRepository _chamadoRepository;
  final LoginController _loginController = Get.find();
  final MainController mainController = Get.find();

  RequestRescueController(this._chamadoRepository);

  final _animalEditing = Animal.empty().obs;
  Animal get animalEditing => _animalEditing.value;

  final _chamadoDTO = ChamadoDTO.empty().obs;
  ChamadoDTO get chamadoDTO => _chamadoDTO.value;

  final _listLocation = <LatLng?>[].obs;
  List<LatLng?> get listLocation => _listLocation.toList();

  final _setMarker = <Marker>[].obs;
  Set<Marker> get setMarker => _setMarker.toSet();

  final _marking = false.obs;
  set marking(value) => _marking.value = value;
  get marking => this._marking.value;

  final _animalState = <String>['Saúdavel', 'Urgente'].obs;
  List<String> get animalState => _animalState.toList();

  TextEditingController description = TextEditingController();
  TextEditingController estadoAnimal = TextEditingController();
  final formDesc = GlobalKey<FormState>();

  void onChangeSolicitation(
      {String? estado,
      String? descricao,
      double? latitude,
      double? longitude}) {
    _animalEditing.value = _animalEditing.value.copyWith(
        estado: estado,
        descricao: descricao,
        latitude: latitude,
        longitude: longitude);
  }

  void confirmRequestRescue() async {
    print('CAI AQUI ${mainController.image.path}');
    var path = mainController.image.path;
    File imageFile = File(path);
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64.encode(imageBytes);
    final context = Get.context;
    final dependencies = AppDependencies.of(context!);

    _chamadoDTO.value.animal = _animalEditing.value;
    _chamadoDTO.value.loginDTO = dependencies.userDTO;
    _chamadoDTO.value.img = base64Image;

    var response = await _chamadoRepository.createChamado(chamadoDTO);
    if (response == null) {
      Get.offNamed(Routes.SUCCESSPAGE,
          arguments: 'Solicitação Resgate realizado \n com sucesso!');
      Future.delayed(Duration(seconds: 3), () {
        Get.offNamed(Routes.MAIN, arguments: _chamadoDTO.value);
        mainController.loadRescueChamado();
      });
    }
  }
}
