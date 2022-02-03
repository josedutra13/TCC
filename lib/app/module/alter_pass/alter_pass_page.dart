import 'package:auresgate/app/module/alter_pass/alter_pass_controller.dart';
import 'package:auresgate/app/module/alter_pass/widgets/alter_pass_input.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:auresgate/app/widgets/button_widgets.dart';
import 'package:auresgate/app/widgets/inputs_widgets.dart';
import 'package:auresgate/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AlterPassPage extends GetView<AlterPassController> {
  const AlterPassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(25.0),
      child: SingleChildScrollView(
        child: Obx(
          () => Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: controller.formAlter,
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
                  child: Text('Alterar Senha',
                      style: TextStyle(
                          color: MainColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Geomanist',
                          fontSize: 28)),
                ),
                MainInput(
                  labelText: 'Nova senha',
                  isPassword: true,
                  controller: controller.passwordText,
                  onTap: () =>
                      controller.showPassword = !controller.showPassword,
                  obscureText: !controller.showPassword,
                  showPass: controller.showPassword,
                  validator: (value) => value!.length < 8
                      ? 'O tamanho minimo da senha e de 8 caracteres'
                      : null,
                ),
                MainInput(
                  labelText: 'Confirmar Senha',
                  isPassword: true,
                  controller: controller.confirmPassText,
                  onTap: () => controller.showConfirmPassword =
                      !controller.showConfirmPassword,
                  obscureText: !controller.showConfirmPassword,
                  showPass: controller.showConfirmPassword,
                  validator: (value) => value != controller.passwordText.text
                      ? 'O valor digitado no campo anterior não condiz com esse'
                      : null,
                ),
                SizedBox(
                  height: 40,
                ),
                ButtonWidget(
                  buttonText: 'Confirmar',
                  onPressed: () {
                    controller.changePassword();
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
      ),
    ));
  }
}
