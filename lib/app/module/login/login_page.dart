import 'package:auresgate/app/routes/app_routes.dart';
import 'package:auresgate/app/widgets/inputs_widgets.dart';
import '../../../colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formLogin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 60, left: 60, top: 60),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.width * 0.6,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, bottom: 5),
                child: Focus(
                    onFocusChange: (focus) => focus
                        ? controller.onFocusLogin = true
                        : controller.onFocusLogin = false,
                    child: MainInput(
                      labelText: 'Usuário',
                      controller: controller.usuarioText,
                      isFocus: controller.onFocusLogin,
                      validator: (value) =>
                          value!.length < 3 ? 'User muito pequeno' : null,
                    )),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(right: 20, left: 20, bottom: 5),
                  child: Focus(
                    onFocusChange: (focus) => focus
                        ? controller.onFocusPass = true
                        : controller.onFocusPass = false,
                    child: MainInput(
                      labelText: 'Senha',
                      controller: controller.senhaText,
                      isFocus: controller.onFocusPass,
                      obscureText: true,
                      isPassword: true,
                    ),
                  )),
              InkWell(
                onTap: () {
                  Get.offNamed(Routes.RECOVER_PASS);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0, top: 8),
                  child: Text(
                    'Esqueci minha senha',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.87,
                    height: MediaQuery.of(context).size.width * 0.11,
                    child: ElevatedButton(
                        onPressed: () {
                          if (controller.formLogin.currentState!.validate()) {
                            controller.loginUser(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shadowColor: MainColors.primaryColor,
                            primary: MainColors.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                    color: MainColors.primaryColor))),
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                              fontSize: 22,
                              color: MainColors.whiteColor,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25.0, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Não tem uma conta? '),
                    InkWell(
                        onTap: () {
                          Get.toNamed(Routes.REGISTER);
                        },
                        child: Text(
                          'Crie agora',
                          style: TextStyle(color: MainColors.primaryColor),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 26),
                child: Row(
                  children: [
                    Container(
                      color: MainColors.primaryColor,
                      width: MediaQuery.of(context).size.width * 0.31,
                      height: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Text('Ou entre com'),
                    ),
                    Container(
                      color: MainColors.primaryColor,
                      width: MediaQuery.of(context).size.width * 0.31,
                      height: 1,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.87,
                    height: MediaQuery.of(context).size.width * 0.11,
                    child: ElevatedButton(
                        onPressed: () {
                          controller.loginUser(context);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: MainColors.whiteColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                    color: MainColors.primaryColor))),
                        child: Text(
                          'Entrar com o Google',
                          style: TextStyle(
                              fontSize: 18,
                              color: MainColors.primaryColor,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
