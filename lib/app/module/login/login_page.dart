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
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  padding:
                      const EdgeInsets.only(right: 25, left: 25, bottom: 5),
                  child: MainInput(
                    labelText: 'Usuário',
                    controller: controller.usuarioText,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Digite seu usuário para prosseguir';
                      } else if (value.length < 3) {
                        return 'Usuário muito pequeno';
                      } else if (controller.invalidLogin) {}
                    },
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25, bottom: 5),
                child: MainInput(
                  labelText: 'Senha',
                  controller: controller.senhaText,
                  obscureText: !controller.showPass,
                  onTap: () {
                    controller.showPass = !controller.showPass;
                  },
                  showPass: controller.showPass,
                  isPassword: true,
                  validator: (value) => controller.invalidLogin
                      ? 'Usuario ou senha invalida'
                      : null,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.RECOVER_PASS);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0, top: 5),
                  child: Text(
                    'Esqueci minha senha',
                    style: TextStyle(
                        color: MainColors.blackColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Geomanist',
                        fontSize: 15),
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
                        onPressed: () => controller.login(),
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
                              color: MainColors.whiteColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Geomanist',
                              fontSize: 22),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25.0, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Não tem uma conta? ',
                      style: TextStyle(
                          color: MainColors.blackColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Geomanist',
                          fontSize: 15),
                    ),
                    InkWell(
                        onTap: () {
                          Get.toNamed(Routes.REGISTER);
                        },
                        child: Text(
                          'Crie agora',
                          style: TextStyle(
                              color: MainColors.primaryColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Geomanist',
                              fontSize: 15),
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
                      child: Text('Ou entre com',
                          style: TextStyle(
                              color: MainColors.blackColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Geomanist',
                              fontSize: 15)),
                    ),
                    Container(
                      color: MainColors.primaryColor,
                      width: MediaQuery.of(context).size.width * 0.28,
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
                        onPressed: () {},
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
