import 'package:auresgate/app/module/request_rescue/request_rescue_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestRescue extends GetView<RequestRescueController> {
  const RequestRescue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fundo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Text('SOLICITAR RESGATE',
                      style: GoogleFonts.bebasNeue(
                          color: Colors.white, fontSize: 40)),
                ),
              ],
            ),
          ),
          //CONTAINER DE DESCRIÇÃO
          Padding(
              padding: const EdgeInsets.only(top: 50.0),
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
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: BoxDecoration(
                                color: Colors.lightBlue.shade300,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: TextField(
                              minLines: null,
                              maxLines: null,
                              expands: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
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
            padding: const EdgeInsets.only(bottom: 380),
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
            padding: const EdgeInsets.only(top: 610.0),
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
                        Get.toNamed(Routes.MAIN);
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
    );
  }
}
