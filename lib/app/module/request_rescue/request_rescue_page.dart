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
  RequestRescuePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppPageBarWidget(
        title: 'Solicitar resgate',
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
              child: Form(
                key: controller.formDesc,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // IMAGEM DE PERFIL DO ANIMAL
                      Padding(
                        padding: const EdgeInsets.only(top: 2, bottom: 19),
                        child: Center(
                          //TODO REFACTORY PARA COLOCAR BORDA BRANCA
                          child: ClipOval(
                            child: Image.file(
                              controller.mainController.image,
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
                      ),
                      DropDownInput(
                        labelText: 'Estado do animal',
                        items: controller.animalState.map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        validator: (value) => value == null
                            ? 'Estado do animal obrigatorio'
                            : null,
                        onChanged: (value) => {
                          controller.estadoAnimal.text = value,
                        },
                      ),

                      SizedBox(
                        height: 45,
                      ),
                      ButtonWidget(
                        buttonText: 'Marcar localização',
                        onPressed: () {
                          if (controller.formDesc.currentState!.validate()) {
                            print('AQUI KRLLLL ${controller.description}');
                            Get.offNamed(Routes.SOLICITATE_LOCATION,
                                parameters: {
                                  'descricao': controller.description.text,
                                  'estadoAnimal': controller.estadoAnimal.text
                                });
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
          ),
        ),
      ),
    );
  }
}
