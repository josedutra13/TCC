import 'package:auresgate/app/module/edit_rescue/widgets/button_edit_widget.dart';
import 'package:auresgate/app/module/main/main_controller.dart';
import 'package:auresgate/app/module/register_account/widgets/radio_button_widget.dart';

import 'package:auresgate/app/module/request_rescue/request_rescue_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:auresgate/app/widgets/appBar_widgets.dart';
import 'package:auresgate/app/widgets/button_widgets.dart';
import 'package:auresgate/app/widgets/description_widget.dart';
import 'package:auresgate/app/widgets/inputs_widgets.dart';
import 'package:auresgate/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestRescuePage extends GetView<RequestRescueController> {
  MainController _mainController = Get.find();

  RequestRescuePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppPageBarWidget(
        title: 'Solicita resgate',
        titleStyle: TextStyle(
            fontFamily: 'Geomanist',
            color: MainColors.primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 23),
        hasIcon: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: controller.formDesc,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // IMAGEM DE PERFIL DO ANIMAL
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 20),
                  child: Center(
                    //TODO REFACTORY PARA COLOCAR BORDA BRANCA
                    child: ClipOval(
                      child: Image.file(
                        _mainController.image,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                DescriptionWidget(
                  controller: controller.description,
                  validator: (value) =>
                      value!.isEmpty ? 'Descrição obrigatoria' : null,
                  onChanged: (value) =>
                      controller.onChangeSolicitation(descricao: value),
                ),
                DropDownInput(
                  labelText: 'Estado do animal',
                  items: controller.animalState.map((e) {
                    return DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    );
                  }).toList(),
                  validator: (value) =>
                      value == null ? 'Estado do animal obrigatorio' : null,
                  onChanged: (value) =>
                      {controller.onChangeSolicitation(estado: value)},
                ),

                SizedBox(
                  height: 90,
                ),
                ButtonWidget(
                  buttonText: 'Marcar localização',
                  onPressed: () {
                    if (controller.formDesc.currentState!.validate()) {
                      Get.toNamed(
                        Routes.SOLICITATE_LOCATION,
                      );
                    }
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
        ),
      ),
    );
  }
}
