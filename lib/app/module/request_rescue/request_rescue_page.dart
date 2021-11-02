import 'package:auresgate/app/module/register/widgets/radio_button_widget.dart';
import 'package:auresgate/app/module/request_rescue/request_rescue_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestRescuePage extends GetView<RequestRescueController> {
  const RequestRescuePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[300],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 25),
                    child: Text('SOLICITAR RESGATE',
                        style: GoogleFonts.bebasNeue(
                            color: Colors.white, fontSize: 40)),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                //CONTAINER DE DESCRIÇÃO
                Padding(
                    padding: const EdgeInsets.only(top: 90.0),
                    child: Center(
                        child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.5,
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
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
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
                                  child: TextField(
                                    minLines: null,
                                    maxLines: null,
                                    expands: true,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ))),
                //

                // IMAGEM DE PERFIL DO ANIMAL
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10),
              child: Text(
                'Estado do animal:',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, bottom: 10),
              child: Obx(() => Row(
                    children: [
                      RadioButton(
                        groupT: controller.optUsers,
                        value: 1,
                        color: Colors.red,
                        text: 'URGENTE',
                        onChanged: (value) {
                          controller.optUsers = value;
                        },
                      ),
                      RadioButton(
                        groupT: controller.optUsers,
                        value: 2,
                        color: Colors.green,
                        text: 'SAUDÁVEL',
                        onChanged: (value) {
                          controller.optUsers = value;
                        },
                      )
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: 350,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green.shade400,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(
                                    color: Colors.green.shade400, width: 2))),
                        child: Text(
                          'MARCAR LOCALIZAÇÃO',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          controller.marking = true;
                          Get.offNamed(Routes.MAIN);
                        },
                      ),
                    ),
                  ),
                  // CANCELAR
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      width: 350,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red.shade300,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(
                                    color: Colors.red.shade300, width: 2))),
                        child: Text(
                          'VOLTAR',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
