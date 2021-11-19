import 'package:auresgate/app/module/register/widgets/radio_button_widget.dart';
import 'package:auresgate/app/module/rescue/rescue_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RescuePage extends GetView<RescueController> {
  RescuePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[300],
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, bottom: 25),
                        child: Text('RESGATE',
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
                          height: MediaQuery.of(context).size.height * 0.5,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 70.0),
                                child: Text(
                                  'Descrição',
                                  style: GoogleFonts.bebasNeue(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Center(
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        decoration: BoxDecoration(
                                            color: Colors.lightBlue.shade300,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, top: 8.0),
                                          child: Text(
                                            '${controller.rescue.animal!.descricao}',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )),
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
                            '${controller.rescue.animal!.descricao}',
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Obx(() => Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          RadioButton(
                            groupT: controller.optUsers,
                            value: 1,
                            color: Colors.red,
                            text: 'URGENTE',
                            onChanged: (_) {},
                          ),
                          RadioButton(
                            groupT: controller.optUsers,
                            value: 2,
                            color: Colors.green,
                            text: 'SAUDÁVEL',
                            onChanged: (_) {},
                          )
                        ],
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          width: 350,
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
                              'AuResgate',
                              style: TextStyle(fontSize: 30),
                            ),
                            onPressed: () {
                              controller.startRescueFunc();
                              Get.offNamed(Routes.MAIN);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Center(
                          child: Container(
                            width: 350,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red.shade300,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: BorderSide(
                                          color: Colors.red.shade300,
                                          width: 2))),
                              child: Text(
                                'VOLTAR',
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
                )
              ],
            ),
          ),
        ));
  }
}
