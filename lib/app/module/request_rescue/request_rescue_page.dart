import 'package:auresgate/app/module/edit_rescue/widgets/button_edit_widget.dart';
import 'package:auresgate/app/module/main/main_controller.dart';
import 'package:auresgate/app/module/register_account/widgets/radio_button_widget.dart';

import 'package:auresgate/app/module/request_rescue/request_rescue_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:auresgate/app/widgets/appBar_widgets.dart';
import 'package:auresgate/app/widgets/button_widgets.dart';
import 'package:auresgate/app/widgets/inputs_widgets.dart';
import 'package:auresgate/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestRescuePage extends GetView<RequestRescueController> {
  MainController _mainController = Get.find();

  RequestRescuePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppPageBarWidget(
        title: 'Solicita resgate',
        hasIcon: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
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
              Text('Descrição',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: MainColors.primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  )),

              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 160,
                  child: TextFormField(
                    expands: true,
                    enabled: true,
                    minLines: null,
                    maxLines: null,
                    decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                        labelStyle: TextStyle(color: Colors.transparent),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(0),
                child: DropDownInput(
                  labelText: 'Estado do animal',
                  items: controller.animalState.map((e) {
                    return DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    );
                  }).toList(),
                  onChanged: (value) =>
                      {controller.onChangeSolicitation(estado: value)},
                ),
              ),
              SizedBox(
                height: 110,
              ),
              ButtonWidget(
                buttonText: 'Marcar localização',
                onPressed: () {
                  Get.toNamed(Routes.SOLICITATE_LOCATION);
                },
              ),
              ButtonWidget(
                  isBack: true,
                  buttonText: 'Voltar',
                  onPressed: () {
                    Get.back();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
