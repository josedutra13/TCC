import 'package:auresgate/app/module/recover_pass/recover_pass_controller.dart';
import 'package:auresgate/app/module/recover_pass/widgets/recover_input.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RecoverPassPage extends GetView<RecoverPassController> {
  const RecoverPassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[300],
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 35),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.34,
                    height: 150,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('RECUPERAR SENHA',
                        style: GoogleFonts.bebasNeue(
                            color: Colors.white, fontSize: 30)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RecoverInput(
                            label: 'EMAIL',
                            controller: controller.emailText,
                            onChanged: (_) {},
                            placeholder: '',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 60),
                            child: Container(
                              width: 220,
                              height: 25,
                              child: ElevatedButton(
                                  onPressed: () {
                                    controller.emailConfirmation(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.cyan[300],
                                      primary: Colors.cyan[300],
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      )),
                                  child: Text(
                                    'Confirmar',
                                    style: GoogleFonts.bebasNeue(
                                        color: Colors.white, fontSize: 20),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 15),
                            child: Container(
                              width: 220,
                              height: 25,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Get.offNamed(Routes.LOGIN);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.grey.shade200),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      )),
                                  child: Text(
                                    'Voltar',
                                    style: GoogleFonts.bebasNeue(
                                        color: Colors.cyan[300], fontSize: 20),
                                  )),
                            ),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
