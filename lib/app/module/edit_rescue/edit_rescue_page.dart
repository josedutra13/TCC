import 'dart:convert';

import 'package:auresgate/app/module/edit_rescue/edit_rescue_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:auresgate/app/widgets/button_widgets.dart';
import 'package:auresgate/app/widgets/inputs_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../colors.dart';
import '../../widgets/appBar_widgets.dart';
import '../../widgets/description_widget.dart';

class EditRescuePage extends GetView<EditRescueController> {
  EditRescuePage({Key? key}) : super(key: key);
  Image imageRescue() {
    print('TEST IMAGE ${controller.rescue.animal!.imagem!}');
    final decodedBytes =
        Base64Decoder().convert(controller.rescue.animal!.imagem!);
    var image =
        Image.memory(decodedBytes, fit: BoxFit.cover, width: 150, height: 150);
    print('Imagem $image');
    return image;
  }

  Future<bool> onWillPop() async {
    if (Get.currentRoute != Routes.EDIT_RESCUE) {
      Get.offNamed(Routes.MAIN);
    }
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppPageBarWidget(
          title: 'Editar chamado',
          titleStyle: TextStyle(
              fontFamily: 'Geomanist',
              color: MainColors.primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 23),
          hasIcon: true,
        ),
        body: LayoutBuilder(
          builder: (context, contraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: contraints.maxHeight),
              child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2, bottom: 19),
                        child: Center(
                          //TODO REFACTORY PARA COLOCAR BORDA BRANCA
                          child: Obx(() => ClipOval(
                                child: controller.isPicked
                                    ? imageRescue()
                                    : Image.file(
                                        controller.mainController.image,
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                              )),
                        ),
                      ),
                      DescriptionWidget(
                        initialValue: controller.rescue.animal!.descricao,
                      ),
                      DropDownInput(
                        labelText: 'Estado do animal',
                        items: controller.animalStates.map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (state) {},
                      ),
                      ButtonWidget(
                        buttonText: 'Salvar',
                        onPressed: () {
                          controller.updateRequest();
                          Get.offNamed(Routes.MAIN);
                        },
                      ),
                      ButtonWidget(
                        buttonText: 'Voltar',
                        isBack: true,
                        onPressed: () {
                          if (Get.previousRoute == Routes.STORY) {
                            Get.offNamed(Routes.STORY,
                                arguments: controller.userDto);
                          } else {
                            Get.offNamed(Routes.MAIN);
                          }
                        },
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
