import 'dart:convert';

import 'package:auresgate/app/data/repository/chamado_repository.dart';
import 'package:auresgate/app/module/edit_rescue/edit_rescue_controller.dart';
import 'package:auresgate/app/module/login/login_controller.dart';
import 'package:auresgate/app/module/main/main_controller.dart';
import 'package:auresgate/app/module/story/widgets/card_story.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/DTO/userDTO_model.dart';

class StoryController extends GetxController {
  final _userDto = UserDTO.empty().obs;
  UserDTO get userDto => _userDto.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final arguments = Get.arguments;
    _userDto.value = arguments;
    print('STORY USERDTO ${_userDto.value.nome}');
    listStory();
  }

  ChamadoRepository _chamadoRepository = ChamadoRepository();
  // LoginController _loginController = Get.find();
  MainController _mainController = Get.find();

  List listStory({BuildContext? context}) {
    var listStory;
    listStory = _mainController.listChamadosRescue.map((e) {
      print('IMAGEM: ${e.animal!.imagem}');
      final decodedBytes = Base64Decoder().convert(e.animal!.imagem!);
      var image = Image.memory(decodedBytes,
          fit: BoxFit.cover, width: 100, height: 100);
      if ((e.usuario_abriu_chamado!.id == _userDto.value.id ||
              e.usuario_atendeu_chamado!.id == _userDto.value.id) &&
          e.status != 'ANDAMENTO') {
        return CardStory(
          onPressedEdit: () => editRequestInStory(e.id.toString()),
          onPressed: () => deleteRequest(context!, e.id!),
          image: image,
          status: e.status,
        );
      } else {
        return SizedBox(
          height: 1,
        );
      }
    }).toList();
    print('AQUIII $listStory');
    return listStory;
  }

  void editRequestInStory(String id) async {
    Get.offNamed(Routes.EDIT_RESCUE,
        parameters: {'id': id}, arguments: _mainController.userDto);
  }

  void deleteRequest(BuildContext context, int id) async {
    showDialog(
        context: context,
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
                                  await _chamadoRepository
                                      .deleteChamado(id)
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
