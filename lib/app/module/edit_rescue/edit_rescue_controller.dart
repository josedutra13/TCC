import 'dart:convert';
import 'dart:io';

import 'package:auresgate/app/data/models/animal_model.dart';
import 'package:auresgate/app/data/models/chamado_model.dart';
import 'package:auresgate/app/data/repository/chamado_repository.dart';
import 'package:auresgate/app/module/main/main_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class EditRescueController extends GetxController {
  String id = '';
  MainController mainController = Get.find();
  ChamadoRepository _chamadoRepository = ChamadoRepository();

  final _optUsers = 0.obs;
  get optUsers => this._optUsers.value;
  set optUsers(value) => this._optUsers.value = value;

  final _isEditing = false.obs;
  bool get isEditing => _isEditing.value;
  set isEditing(bool value) => _isEditing.value = value;

  final _isPicked = true.obs;
  bool get isPicked => _isPicked.value;
  set isPicked(bool value) => _isPicked.value = value;

  final _animalEditing = Animal.empty().obs;
  Animal get animalEditing => _animalEditing.value;

  final _image = File('').obs;
  File get image => _image.value;
  set image(File value) => _image.value = value;

  final _rescue = Chamado.empty().obs;
  Chamado get rescue => _rescue.value;
  set rescue(Chamado value) => _rescue.value = value;

  TextEditingController descriptionEdit = TextEditingController();
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

      print('ID => LOAD $id');
    }
  }

  // void checkButton() {
  //   if (_rescue.value.animal!.estado == 'Urgente') {
  //     animalState.text = 'Urgente';
  //   } else {
  //     animalState.text = 'Saúdavel';
  //   }
  // }

  void loadInfoRescue() {
    mainController.listChamadosRescue.forEach((element) {
      if (id == element.id.toString()) {
        _rescue.value = element;
      }
    });
    print('resgate:  ${rescue.animal!.descricao}');
  }

  void onEditAnimal(
      {String? estado,
      String? descricao,
      double? latitude,
      double? longitude,
      String? imagem}) {
    _animalEditing.value = _animalEditing.value.copyWith(
        estado: estado,
        descricao: descricao,
        latitude: latitude,
        longitude: longitude,
        imagem: imagem);
  }

  Future pickImage() async {
    try {
      final imageF = await ImagePicker().pickImage(source: ImageSource.camera);
      if (imageF == null) return;

      final imageTemporary = File(imageF.path);
      List<int> imageBytes = imageTemporary.readAsBytesSync();
      String base64Image = base64.encode(imageBytes);

      _image.value = imageTemporary;
      _animalEditing.value.imagem = base64Image;
      print('IMAGEM ANIMAL AQUI : ${animalEditing.imagem}');
      _isPicked.value = false;
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  void updateRequest() async {
    _rescue.value.animal = _animalEditing.value;
    await _chamadoRepository.updateChamado(rescue.animal!, int.parse(id));
  }

  void deleteRequest(BuildContext? context) async {
    showDialog(
        context: context!,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
                height: 140,
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: const Color(0xFFFFFF),
                  borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
                ),
                child: Column(
                  children: [
                    Image.asset('assets/icons/alerta.png',
                        height: 35, width: 50),
                    SizedBox(height: 5),
                    Text(
                      'DESEJA REALMENTE EXCLUIR A SOLICITAÇÃO?',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Container(
                              height: 35,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green.shade300,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        side: BorderSide(
                                            color: Colors.green.shade300,
                                            width: 2))),
                                child: Text(
                                  'SIM',
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () async {
                                  print('ID AQUI $id');
                                  await _chamadoRepository
                                      .deleteChamado(int.parse(id))
                                      .then((value) {
                                    if (value == true) {
                                      Get.back();
                                      Get.offNamed(Routes.MAIN);
                                    } else {
                                      print('[ERRO] ');
                                    }
                                  });
                                },
                              ),
                            ),
                          )),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Container(
                              height: 35,
                              width: 45,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red.shade300,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        side: BorderSide(
                                            color: Colors.red.shade300,
                                            width: 2))),
                                child: Text(
                                  'NÃO',
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
