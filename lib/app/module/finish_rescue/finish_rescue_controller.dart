import 'dart:convert';
import 'dart:io';

import 'package:auresgate/app/data/models/chamadoDTO_model.dart';
import 'package:auresgate/app/data/models/chamado_model.dart';
import 'package:auresgate/app/data/repository/chamado_repository.dart';
import 'package:auresgate/app/module/main/main_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:get/get.dart';

class FinishRescueController extends GetxController {
  final MainController mainController = Get.find();
  final ChamadoRepository _chamadoRepository = ChamadoRepository();

  final _chamado = Chamado.empty().obs;
  Chamado get chamado => _chamado.value;

  void onFinishRescue() async {
    var path = mainController.image.path;
    File imageFile = File(path);
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64.encode(imageBytes);

    _chamado.value.imagem = base64Image;

    await _chamadoRepository.finalizarChamado(chamado).whenComplete(() {
      Get.offNamed(Routes.MAIN);
    });
  }
}
