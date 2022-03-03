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
    final decodedBytes =
        Base64Decoder().convert(controller.rescue.animal!.imagem.toString());
    var image =
        Image.memory(decodedBytes, fit: BoxFit.cover, width: 150, height: 150);
    print('Imagem $image');
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppPageBarWidget(
        title: 'Editar chamado',
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 19),
                  child: Center(
                    //TODO REFACTORY PARA COLOCAR BORDA BRANCA
                    child: ClipOval(
                      child: controller.isPicked
                          ? imageRescue()
                          : Image.file(
                              controller.mainController.image,
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                    ),
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
                      Get.offNamed(Routes.STORY);
                    } else {
                      Get.offNamed(Routes.MAIN);
                    }
                  },
                )
              ],
            )),
      ),
      // SingleChildScrollView(
      //   child: Obx(
      //     () => Column(
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.only(top: 15.0),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Padding(
      //                 padding: const EdgeInsets.only(top: 30.0, bottom: 25),
      //                 child: Text('EDITAR CHAMADO',
      //                     style: GoogleFonts.bebasNeue(
      //                         color: Colors.white,
      //                         fontSize: 40,
      //                         letterSpacing: 5)),
      //               ),
      //             ],
      //           ),
      //         ),
      //         Stack(
      //           children: [
      //             //CONTAINER DE DESCRIÇÃO
      //             Padding(
      //                 padding: const EdgeInsets.only(top: 100.0),
      //                 child: Center(
      //                     child: Container(
      //                   width: MediaQuery.of(context).size.width * 0.9,
      //                   height: MediaQuery.of(context).size.height * 0.56,
      //                   decoration: BoxDecoration(
      //                       color: Colors.white,
      //                       borderRadius:
      //                           BorderRadius.all(Radius.circular(20))),
      //                   child: Column(
      //                     children: [
      //                       Padding(
      //                         padding: const EdgeInsets.only(top: 70.0),
      //                         child: Text(
      //                           'Descrição',
      //                           style: GoogleFonts.bebasNeue(
      //                               color: Colors.grey,
      //                               fontSize: 22,
      //                               fontWeight: FontWeight.w400,
      //                               letterSpacing: 3),
      //                         ),
      //                       ),
      //                       Padding(
      //                           padding: const EdgeInsets.only(top: 20.0),
      //                           child: Center(
      //                             child: Container(
      //                               width: MediaQuery.of(context).size.width *
      //                                   0.75,
      //                               height: MediaQuery.of(context).size.height *
      //                                   0.3,
      //                               decoration: BoxDecoration(
      //                                   color: Colors.lightBlue.shade300,
      //                                   borderRadius: BorderRadius.all(
      //                                       Radius.circular(20))),
      //                               child: Padding(
      //                                 padding: const EdgeInsets.only(
      //                                     left: 8.0, top: 5),
      //                                 child: TextFormField(
      //                                   initialValue:
      //                                       '${controller.rescue.animal!.descricao}',
      //                                   expands: true,
      //                                   minLines: null,
      //                                   maxLines: null,
      //                                   enabled: controller.isEditing,
      //                                   onChanged: (value) {
      //                                     controller.onEditAnimal(
      //                                         descricao: value);
      //                                   },
      //                                   style: TextStyle(color: Colors.white),
      //                                 ),
      //                               ),
      //                             ),
      //                           )),
      //                     ],
      //                   ),
      //                 ))),
      //             //

      //             // IMAGEM DE PERFIL DO ANIMAL
      //             Padding(
      //               padding: const EdgeInsets.only(),
      //               child: Center(
      //                 //TODO REFACTORY PARA COLOCAR BORDA BRANCA
      //                 child: Obx(() => ClipOval(
      //                       child: controller.isPicked
      //                           ? imageRescue()
      //                           : Image.file(controller.image,
      //                               fit: BoxFit.cover, width: 150, height: 150),
      //                     )),
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.only(left: 250.0),
      //               child: ButtonEdit(
      //                   padding: EdgeInsets.only(top: 80),
      //                   onPressed: () {
      //                     controller.pickImage().whenComplete(
      //                         () => Get.toNamed(Routes.EDIT_RESCUE));
      //                   },
      //                   icon: Image.asset(
      //                     'assets/icons/camera_black.png',
      //                     scale: 4,
      //                     fit: BoxFit.scaleDown,
      //                   )),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.only(top: 350.0, right: 30),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.end,
      //                 children: [
      //                   ButtonEdit(
      //                       height: 50,
      //                       width: 50,
      //                       onPressed: () {
      //                         controller.isEditing = true;
      //                         Get.toNamed(Routes.SOLICITATE_LOCATION);
      //                       },
      //                       icon: Image.asset(
      //                         'assets/icons/mapas-e-bandeiras.png',
      //                         scale: 4,
      //                         fit: BoxFit.scaleDown,
      //                       )),
      //                   SizedBox(
      //                     width: 15,
      //                   ),
      //                   ButtonEdit(
      //                       height: 50,
      //                       width: 50,
      //                       onPressed: () {
      //                         controller.isEditing = true;
      //                       },
      //                       icon: Image.asset(
      //                         'assets/icons/ferramenta-lapis.png',
      //                         scale: 4,
      //                         fit: BoxFit.scaleDown,
      //                       )),
      //                   SizedBox(
      //                     width: 15,
      //                   ),
      //                   ButtonEdit(
      //                       height: 50,
      //                       width: 50,
      //                       onPressed: () {
      //                         controller.deleteRequest(context);
      //                       },
      //                       icon: Image.asset(
      //                         'assets/icons/lixeira-de-reciclagem.png',
      //                         scale: 4,
      //                         fit: BoxFit.scaleDown,
      //                       )),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //         MainInput(
      //             isRescue: false,
      //             labelText: 'Estado do animal',
      //             controller: controller.animalState),
      //         Padding(
      //           padding: const EdgeInsets.only(top: 20.0),
      //           child: Column(
      //             children: [
      //               Center(
      //                 child: Container(
      //                   width: 300,
      //                   height: 50,
      //                   child: ElevatedButton(
      //                     style: ElevatedButton.styleFrom(
      //                         primary: Colors.greenAccent.shade400,
      //                         shape: RoundedRectangleBorder(
      //                             borderRadius: BorderRadius.circular(15.0),
      //                             side: BorderSide(
      //                                 color: Colors.greenAccent.shade400,
      //                                 width: 2))),
      //                     child: Text(
      //                       'SALVAR',
      //                       style: TextStyle(fontSize: 30),
      //                     ),
      //                     onPressed: () {
      //                       controller.updateRequest();
      //                       Get.offNamed(Routes.MAIN);
      //                     },
      //                   ),
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(top: 20.0, bottom: 20),
      //                 child: Center(
      //                   child: Container(
      //                     width: 300,
      //                     height: 50,
      //                     child: ElevatedButton(
      //                       style: ElevatedButton.styleFrom(
      //                           primary: Colors.red.shade300,
      //                           shape: RoundedRectangleBorder(
      //                               borderRadius: BorderRadius.circular(15.0),
      //                               side: BorderSide(
      //                                   color: Colors.red.shade300, width: 2))),
      //                       child: Text(
      //                         'CANCELAR',
      //                         style: TextStyle(fontSize: 30),
      //                       ),
      //                       onPressed: () {
      //                         if (Get.previousRoute == Routes.STORY) {
      //                           Get.offNamed(Routes.STORY);
      //                         } else {
      //                           Get.offNamed(Routes.MAIN);
      //                         }
      //                       },
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               // CANCELAR
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
