import 'dart:convert';
import 'dart:io';
import 'package:auresgate/app/data/models/chamado_model.dart';
import 'package:auresgate/app/data/repository/chamado_repository.dart';
import 'package:auresgate/app/module/main/main_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:get/get.dart';

class FinishRescueController extends GetxController {
  final MainController mainController = Get.find();
  final ChamadoRepository _chamadoRepository = ChamadoRepository();
  String id = '';

  final _chamado = Chamado.empty().obs;
  Chamado get chamado => _chamado.value;

  @override
  void onInit() {
    super.onInit();

    final param = Get.parameters;

    if (param['id'] != null) {
      id = param['id']!;
      print('ID => LOAD $id');
    }
  }

  void onFinishRescue() async {
    var path = mainController.image.path;
    File imageFile = File(path);
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64.encode(imageBytes);

    await _chamadoRepository
        .finalizarChamado(base64Image, int.parse(id))
        .whenComplete(() {
      Get.offNamed(Routes.MAIN);
    });
  }
}
