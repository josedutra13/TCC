import 'dart:convert';

import 'package:auresgate/app/module/rescue/rescue_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:auresgate/app/widgets/appBar_widgets.dart';
import 'package:auresgate/app/widgets/button_widgets.dart';
import 'package:auresgate/app/widgets/description_widget.dart';
import 'package:auresgate/app/widgets/inputs_widgets.dart';
import 'package:auresgate/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RescuePage extends GetView<RescueController> {
  Image imageRescue() {
    final decodedBytes =
        Base64Decoder().convert(controller.rescue.animal!.imagem.toString());
    var image =
        Image.memory(decodedBytes, fit: BoxFit.cover, width: 150, height: 150);

    return image;
  }

  RescuePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppPageBarWidget(
        title: 'AuResgate',
        titleStyle: TextStyle(
            fontFamily: 'Geomanist',
            color: MainColors.primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 23),
        hasIcon: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // IMAGEM DE PERFIL DO ANIMAL
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 20),
              child: Center(
                //TODO REFACTORY PARA COLOCAR BORDA BRANCA
                child: ClipOval(child: imageRescue()),
              ),
            ),
            DescriptionWidget(
              onChanged: (value) => {},
              textRescue: '${controller.rescue.animal!.descricao}',
              isRescue: true,
              // controller.onChangeSolicitation(descricao: value),
            ),
            MainInput(
                isRescue: false,
                labelText: 'Estado do animal',
                controller: controller.animalState),

            SizedBox(
              height: 54,
            ),
            ButtonWidget(
              buttonText: 'AuResgate',
              onPressed: () {
                controller.startRescueFunc();
                Get.offNamed(Routes.MAIN);
              },
            ),
            ButtonWidget(
                isBack: true,
                buttonText: 'Voltar',
                onPressed: () {
                  Get.offNamed(Routes.MAIN);
                }),
          ],
        ),
      ),
    );
  }
}
