import 'package:auresgate/app/data/models/DTO/chamadoResgateDTO_model.dart';
import 'package:auresgate/app/data/models/chamado_model.dart';
import 'package:auresgate/app/data/repository/chamado_repository.dart';
import 'package:auresgate/app/module/login/login_controller.dart';
import 'package:auresgate/app/module/main/main_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RescueController extends GetxController {
  String id = '';
  MainController mainController = Get.find();
  LoginController loginController = Get.find();
  ChamadoRepository _chamadoRepository = ChamadoRepository();

  final _rescue = Chamado.empty().obs;
  Chamado get rescue => _rescue.value;
  set rescue(Chamado value) => _rescue.value = value;

  final _chamadoDTO = ChamadoResgateDTO.empty().obs;
  ChamadoResgateDTO get chamadoDTO => _chamadoDTO.value;
  set chamadoDTO(ChamadoResgateDTO value) => _chamadoDTO.value = value;

  final _optUsers = 0.obs;
  get optUsers => this._optUsers.value;
  set optUsers(value) => this._optUsers.value = value;

  final _startRescue = false.obs;
  bool get startRescue => _startRescue.value;
  set startRescue(bool value) => _startRescue.value = value;

  final _animalStates = ['Urgente', 'Saudável'].obs;
  List<String> get animalStates => _animalStates;

  TextEditingController animalState = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    final param = Get.parameters;

    if (param['id'] != null) {
      id = param['id']!;

      loadInfoRescue();
      stateSelected();
      print('ID => LOAD $id');
    }
  }

  void stateSelected() {
    if (_rescue.value.animal!.estado == 'URGENTE') {
      animalState.text = 'Urgente';
    } else {
      animalState.text = 'Saúdavel';
    }
  }

  void loadInfoRescue() {
    print('RESGATE ${mainController.listChamadosRescue}');
    mainController.listChamadosRescue.forEach((element) {
      if (id == element.id.toString()) {
        _rescue.value = element;
      }
    });
  }

  void startRescueFunc() async {
    _startRescue.value = true;
    print('ID RESGATE = $id');
    _chamadoDTO.value.idChamado = int.parse(id);
    _chamadoDTO.value.loginDTO = loginController.userDto;
    await _chamadoRepository.associateChamado(chamadoDTO);
  }
}
