import 'package:auresgate/app/data/models/animal_model.dart';
import 'package:auresgate/app/data/models/chamadoDTO_model.dart';
import 'package:auresgate/app/data/models/chamado_model.dart';
import 'package:auresgate/app/data/models/localizacao_model.dart';
import 'package:auresgate/app/data/repository/chamado_repository.dart';
import 'package:auresgate/app/module/login/login_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:get/get.dart';

class RequestRescueController extends GetxController {
  final ChamadoRepository _chamadoRepository;
  final LoginController _loginController = Get.find();

  RequestRescueController(this._chamadoRepository);
  // final _animal = Animal.empty().obs;
  // Animal get animal => _animal.value;

  final _animalEditing = Animal.empty().obs;
  Animal get animalEditing => _animalEditing.value;

  final _chamadoDTO = ChamadoDTO.empty().obs;
  ChamadoDTO get chamadoDTO => _chamadoDTO.value;

  final _listChamadosRescue = <Chamado>[].obs;
  List<Chamado> get listChamadosRescue => _listChamadosRescue.toList();

  final _listLocation = <Localizacao?>[].obs;
  List<Localizacao?> get listLocation => _listLocation.toList();

  final _marking = false.obs;
  set marking(value) => _marking.value = value;
  get marking => this._marking.value;

  final _optUsers = 0.obs;
  get optUsers => this._optUsers.value;
  set optUsers(value) => this._optUsers.value = value;

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

    print('BURRÃO ${_animalEditing.value.descricao}');
  }

  void onConfirmRescue() async {
    _chamadoDTO.value.animal = _animalEditing.value;
    _chamadoDTO.value.loginDTO = _loginController.userDto;
    print('NOME PESSOA ${chamadoDTO.loginDTO.nome}');
    var response = await _chamadoRepository.createChamado(chamadoDTO);
    if (response == null) {
      Get.offNamed(Routes.MAIN);
    }
  }

  void loadRescueChamado() async {
    var response = await _chamadoRepository.listChamado();
    print('AQUIII $response');
    _listChamadosRescue.value = response;
    // _listLocation.value = response.map((e) {
    //   return e.localizacao;
    // }).toList();
  }
}
