import 'package:auresgate/app/module/finish_rescue/finish_rescue_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:auresgate/app/widgets/appBar_widgets.dart';
import 'package:auresgate/app/widgets/button_widgets.dart';
import 'package:auresgate/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FinishRescuePage extends GetView<FinishRescueController> {
  FinishRescuePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppPageBarWidget(
          title: 'Finalizar Resgate',
        ),
        body: SafeArea(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: controller.mainController.isPickTaked,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Center(
                      //TODO REFACTORY PARA COLOCAR BORDA BRANCA
                      child: ClipOval(
                        child: Image.file(
                          controller.mainController.image,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: !controller.mainController.isPickTaked,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: MainColors.primaryColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                //Sombra
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3))
                              ]),
                          height: 200,
                          width: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 80,
                                width: 100,
                                child: IconButton(
                                    onPressed: () {
                                      controller.mainController
                                          .pickImage(ImageSource.camera)
                                          .then(
                                              (value) => Routes.FINISH_RESCUE);
                                    },
                                    icon: SvgPicture.asset(
                                      'assets/icons/photo_camera (1).svg',
                                      height: 80,
                                      fit: BoxFit.fitHeight,
                                    )),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'ADICIONAR FOTO',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Geomanist',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 230,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      ButtonWidget(
                        buttonText: 'Finalizar',
                        onPressed: () {
                          print(!controller.mainController.isPickTaked);
                          if (!controller.mainController.isPickTaked) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(
                                      'Precisamos de uma foto para comprovar que o resgate foi finalizado!!',
                                      style: TextStyle(
                                          color: MainColors.blackColor,
                                          fontFamily: 'Geomanist'),
                                    ),
                                    title: Center(
                                        child: Row(
                                      children: [
                                        Text('IMPORTANTE',
                                            style: TextStyle(
                                                color: MainColors.primaryColor,
                                                fontFamily: 'Geomanist',
                                                fontWeight: FontWeight.bold)),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Icon(
                                            Icons.report_problem,
                                            color: MainColors.primaryColor,
                                          ),
                                        )
                                      ],
                                    )),
                                    actions: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        child: ButtonWidget(
                                          buttonText: 'Fechar',
                                          isBack: true,
                                        ),
                                      )
                                    ],
                                  );
                                });
                          } else {
                            Get.toNamed(Routes.SUCCESSPAGE,
                                arguments: 'Resgate realizado \n com sucesso!');
                            Future.delayed(Duration(seconds: 3), () {
                              controller.onFinishRescue();
                            });
                          }
                        },
                      ),

                      ButtonWidget(
                          buttonText: 'Voltar',
                          isBack: true,
                          onPressed: () {
                            Get.offNamed(Routes.MAIN);
                          }),

                      // CANCELAR
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
