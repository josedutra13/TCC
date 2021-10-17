import 'package:auresgate/app/module/login/login_page.dart';
import 'package:auresgate/app/module/register/register_controller.dart';
import 'package:auresgate/app/module/register/widgets/radio_button_widget.dart';
import 'package:auresgate/app/module/register/widgets/register_input.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Stack(
        children: [
          Image.asset('assets/images/fundo.png'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                //TODO put patinha
                child: Text('CADASTRAR',
                    style: GoogleFonts.bebasNeue(
                        color: Colors.white, fontSize: 50)),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
              child: Form(
                  child: Column(
                children: [
                  RegisterInput(
                    label: 'USUÁRIO',
                    placeholder: 'Informe seu usuário',
                    onChanged: (value) => {},
                  ),
                  RegisterInput(
                      label: 'E-MAIL',
                      placeholder: 'Informe seu e-mail',
                      onChanged: (value) => {}),
                  Obx(() => PasswordInput(
                      label: 'SENHA',
                      placeholder: 'Informe sua senha',
                      controller: controller.passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value) => {},
                      obscureText: !controller.showPassword,
                      onShowPassword: () {
                        controller.showPassword = !controller.showPassword;
                      })),
                  PasswordInput(
                    label: 'CONFIRMAR SENHA',
                    placeholder: 'Confirme sua senha',
                    obscureText: !controller.showPassword,
                    obscureTextOption: false,
                  ),
                  RegisterInput(
                      label: 'TELEFONE',
                      placeholder: 'Informe seu telefone',
                      onChanged: (value) => {}),
                  //TODO COLOCAR UM CAMPO TEXT
                  RegisterInput(
                      label: 'ESTADO',
                      placeholder: 'Informe seu estado',
                      onChanged: (value) => {}),
                  RegisterInput(
                      label: 'CIDADE',
                      placeholder: 'Informe seu cidade',
                      onChanged: (value) => {}),
                  Row(
                    children: [
                      RadioButton(
                        groupT: 1,
                        text: 'ONG',
                      ),
                      RadioButton(
                        groupT: 2,
                        text: 'PESSOA',
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Container(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(
                                        color: Colors.red, width: 2))),
                            child: Text(
                              'CANCELAR',
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              Get.offNamed(Routes.LOGIN);
                            },
                          ),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Container(
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(
                                          color: Colors.green, width: 2))),
                              child: Text(
                                'CONFIRMAR',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                Get.offNamed(Routes.LOGIN);
                              },
                            ),
                          ),
                        ))
                      ],
                    ),
                  )
                ],
              )),
            ),
          )
        ],
      ),
    )));
  }
}
