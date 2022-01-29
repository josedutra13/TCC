import 'package:auresgate/app/routes/app_routes.dart';
import '../../../colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
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
                  const EdgeInsets.only(right: 30, left: 30, bottom: 5, top: 5),
              child: Focus(
                onFocusChange: (focus) => focus
                    ? controller.onCheck = true
                    : controller.onCheck = false,
                child: TextFormField(
                  controller: controller.usuarioText,
                  decoration: InputDecoration(
                      labelText: 'Usuário',
                      labelStyle: TextStyle(
                          color: controller.onCheck
                              ? MainColors.primaryColor
                              : Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: MainColors.primaryColor)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: MainColors.primaryColor))),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 30, left: 30, bottom: 5, top: 5),
              child: Focus(
                onFocusChange: (focus) => focus
                    ? controller.onCheck = true
                    : controller.onCheck = false,
                child: TextFormField(
                  controller: controller.senhaText,
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(
                        color: controller.onCheck
                            ? MainColors.primaryColor
                            : Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: MainColors.primaryColor)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: MainColors.primaryColor)),
                    suffixIcon: Icon(
                      Icons.remove_red_eye_rounded,
                      color: MainColors.blackColor,
                    ),
                  ),
                ),
              ),
            ),
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
                        controller.loginUser(context);
                      },
                      style: ElevatedButton.styleFrom(
                          shadowColor: MainColors.primaryColor,
                          primary: MainColors.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side:
                                  BorderSide(color: MainColors.primaryColor))),
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
                              side:
                                  BorderSide(color: MainColors.primaryColor))),
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
    );
  }
}
