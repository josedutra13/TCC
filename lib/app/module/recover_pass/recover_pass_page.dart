import 'package:auresgate/app/module/recover_pass/recover_pass_controller.dart';
import 'package:auresgate/app/module/recover_pass/widgets/recover_input.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:auresgate/app/widgets/button_widgets.dart';
import 'package:auresgate/app/widgets/inputs_widgets.dart';
import 'package:auresgate/colors.dart';
import 'package:flutter/material.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RecoverPassPage extends GetView<RecoverPassController> {
  const RecoverPassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: controller.formAlter,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 250,
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
              ),
              Center(
                child: Text('RECUPERAR SENHA',
                    style: GoogleFonts.bebasNeue(
                        color: MainColors.primaryColor, fontSize: 30)),
              ),
              MainInput(
                  labelText: 'Email',
                  controller: controller.emailText,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (controller.invalidEmail && validatorEmail(value)) {
                      return 'Email invalido ou não encontrado no sistema';
                    } else {
                      return null;
                    }
                  }),
              SizedBox(
                height: 30,
              ),
              ButtonWidget(
                buttonText: 'Confirmar',
                onPressed: () {
                  controller.emailConfirmation(context);
                },
              ),
              ButtonWidget(
                buttonText: 'Voltar',
                isBack: true,
                onPressed: () {
                  Get.back();
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
