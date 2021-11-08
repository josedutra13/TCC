import 'package:auresgate/app/module/finish_rescue/finish_rescue_controller.dart';
import 'package:auresgate/app/module/request_rescue/request_rescue_controller.dart';
import 'package:auresgate/app/module/rescue/rescue_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FinishRescuePage extends GetView<FinishRescueController> {
  FinishRescuePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 25),
                    child: Text('FINALIZAR CHAMADO',
                        style: GoogleFonts.bebasNeue(
                            color: Colors.white,
                            fontSize: 40,
                            letterSpacing: 5)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                height: 200,
                width: 200,
                child: IconButton(
                  onPressed: () {
                    print('CLIQUEI AQUI');
                  },
                  icon: Image.asset(
                    'assets/icons/camera.png',
                    scale: 4,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'ADICIONAR FOTO',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2),
            ),
            SizedBox(
              height: 80,
            ),
            Column(
              children: [
                Center(
                  child: Container(
                    width: 300,
                    height: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.greenAccent.shade400,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: BorderSide(
                                  color: Colors.greenAccent.shade400,
                                  width: 2))),
                      child: Text(
                        'FINALIZAR',
                        style: TextStyle(fontSize: 35),
                      ),
                      onPressed: () {
                        // controller.marking = true;
                        Get.toNamed(Routes.MAIN);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: Container(
                      width: 300,
                      height: 70,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red.shade300,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(
                                    color: Colors.red.shade300, width: 2))),
                        child: Text(
                          'CANCELAR',
                          style: TextStyle(fontSize: 35),
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
          ],
        ),
      ),
    );
  }
}
