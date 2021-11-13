import 'package:auresgate/app/data/models/chamado_model.dart';
import 'package:auresgate/app/module/login/login_controller.dart';
import 'package:auresgate/app/module/main/main_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RescueController extends GetxController {
  String id = '';
  MainController mainController = Get.find();
  LoginController loginController = Get.find();

  final _rescue = Chamado.empty().obs;
  Chamado get rescue => _rescue.value;
  set rescue(Chamado value) => _rescue.value = value;

  final _optUsers = 0.obs;
  get optUsers => this._optUsers.value;
  set optUsers(value) => this._optUsers.value = value;

  final _statusNumber = 0.obs;
  get statusNumber => this._statusNumber.value;
  set statusNumber(value) => this._statusNumber.value = value;

  @override
  void onInit() {
    super.onInit();

    final param = Get.parameters;

    if (param['id'] != null) {
      id = param['id']!;

      loadInfoRescue();
      checkButton();
      print('ID => LOAD $id');
    }
  }



  void checkButton() {
    if (_rescue.value.animal!.estado == 'URGENTE') {
      _optUsers.value = 1;
    } else {
      _optUsers.value = 2;
    }
  }

  void loadInfoRescue() {
    mainController.listChamadosRescue.forEach((element) {
      if (id == element.id.toString()) {
        _rescue.value = element;
      }
    });

    print('ANIMAL  ${rescue.animal!.descricao}');
  }
}
