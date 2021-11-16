import 'package:auresgate/app/data/repository/chamado_repository.dart';
import 'package:auresgate/app/module/edit_rescue/edit_rescue_controller.dart';
import 'package:auresgate/app/module/edit_rescue/widgets/button_edit_widget.dart';
import 'package:auresgate/app/module/register/widgets/radio_button_widget.dart';
import 'package:auresgate/app/module/request_rescue/request_rescue_controller.dart';
import 'package:auresgate/app/module/rescue/rescue_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EditRescuePage extends GetView<EditRescueController> {
  // RequestRescueController _requestRescueController = Get.find();
  EditRescuePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 25),
                    child: Text('EDITAR CHAMADO',
                        style: GoogleFonts.bebasNeue(
                            color: Colors.white,
                            fontSize: 40,
                            letterSpacing: 5)),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                //CONTAINER DE DESCRIÇÃO
                Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Center(
                        child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.53,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 70.0),
                            child: Text(
                              'Descrição',
                              style: GoogleFonts.bebasNeue(
                                  color: Colors.grey,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 3),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Center(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlue.shade300,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 5),
                                    child: Obx(() => TextFormField(
                                          initialValue:
                                              '${controller.rescueController.rescue.animal!.descricao}',
                                          expands: true,
                                          minLines: null,
                                          maxLines: null,
                                          enabled: controller.isEditing,
                                          onChanged: (value) {
                                            controller.onEditAnimal(
                                                descricao: value);
                                          },
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ))),
                //

                // IMAGEM DE PERFIL DO ANIMAL
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Center(
                    //TODO REFACTORY PARA COLOCAR BORDA BRANCA
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/cururu.png',
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 230.0),
                  child: ButtonEdit(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icons/camera_black.png',
                        scale: 4,
                        fit: BoxFit.scaleDown,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 347.0, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonEdit(
                          height: 50,
                          width: 50,
                          onPressed: () {
                            controller.isEditing = true;
                            Get.toNamed(Routes.SOLICITATE_LOCATION);
                          },
                          icon: Image.asset(
                            'assets/icons/mapas-e-bandeiras.png',
                            scale: 4,
                            fit: BoxFit.scaleDown,
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      ButtonEdit(
                          height: 50,
                          width: 50,
                          onPressed: () {
                            controller.isEditing = true;
                          },
                          icon: Image.asset(
                            'assets/icons/ferramenta-lapis.png',
                            scale: 4,
                            fit: BoxFit.scaleDown,
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      ButtonEdit(
                          height: 50,
                          width: 50,
                          onPressed: () {
                            controller.deleteRequest(context);
                          },
                          icon: Image.asset(
                            'assets/icons/lixeira-de-reciclagem.png',
                            scale: 4,
                            fit: BoxFit.scaleDown,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, bottom: 10, top: 15),
              child: Obx(() => Row(
                    children: [
                      RadioButton(
                        groupT: controller.optUsers,
                        value: 1,
                        color: Colors.red,
                        text: 'URGENTE',
                        onChanged: (value) {
                          controller.optUsers = value;
                          controller.onEditAnimal(estado: 'URGENTE');
                        },
                      ),
                      RadioButton(
                        groupT: controller.optUsers,
                        // isDisabled: controller.isEditing,
                        value: 2,
                        color: Colors.green,
                        text: 'SAUDÁVEL',
                        onChanged: (value) {
                          controller.optUsers = value;
                          controller.onEditAnimal(estado: 'SAUDÁVEL');
                        },
                      )
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.greenAccent.shade400,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(
                                    color: Colors.greenAccent.shade400,
                                    width: 2))),
                        child: Text(
                          'SALVAR',
                          style: TextStyle(fontSize: 30),
                        ),
                        onPressed: () {
                          controller.updateRequest();
                          Get.toNamed(Routes.MAIN);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                    child: Center(
                      child: Container(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red.shade300,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  side: BorderSide(
                                      color: Colors.red.shade300, width: 2))),
                          child: Text(
                            'CANCELAR',
                            style: TextStyle(fontSize: 30),
                          ),
                          onPressed: () {
                            Get.offNamed(Routes.MAIN);
                          },
                        ),
                      ),
                    ),
                  ),
                  // CANCELAR
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
