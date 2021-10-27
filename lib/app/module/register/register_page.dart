import 'package:auresgate/app/data/models/endereco_model.dart';
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
        backgroundColor: Colors.lightBlue.shade300,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Stack(
            children: [
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
                    padding:
                        const EdgeInsets.only(top: 80, left: 20, right: 20),
                    child: Obx(
                      () => Form(
                          key: controller.formKeyAuth,
                          child: Column(
                            children: [
                              RegisterInput(
                                label: 'USUÁRIO',
                                placeholder: 'Informe seu usuário',
                                onChanged: (value) =>
                                    controller.onChangeUser(nome: value),
                              ),
                              RegisterInput(
                                  label: 'E-MAIL',
                                  placeholder: 'Informe seu e-mail',
                                  onChanged: (value) =>
                                      controller.onChangeUser(email: value)),
                              PasswordInput(
                                  label: 'SENHA',
                                  placeholder: 'Informe sua senha',
                                  controller: controller.passwordController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  onChanged: (value) =>
                                      controller.onChangeUser(senha: value),
                                  obscureText: !controller.showPassword,
                                  onShowPassword: () {
                                    controller.showPassword =
                                        !controller.showPassword;
                                  }),
                              PasswordInput(
                                label: 'CONFIRMAR SENHA',
                                placeholder: 'Confirme sua senha',
                                obscureText: !controller.showPassword,
                                obscureTextOption: false,
                              ),
                              RegisterInput(
                                  label: 'TELEFONE',
                                  placeholder: 'Informe seu telefone',
                                  onChanged: (value) =>
                                      controller.onChangeUser(telefone: value)),
                              RegisterInput(
                                  label: 'ESTADO',
                                  placeholder: 'Informe seu estado',
                                  onChanged: (value) => {}),
                              RegisterInput(
                                  label: 'CIDADE',
                                  placeholder: 'Informe sua cidade',
                                  onChanged: (value) => {
                                        controller.onChangeUser(
                                            cidade: int.parse(value))
                                      }),
                              RegisterInput(
                                  label: 'BAIRRO',
                                  placeholder: 'Informe seu bairro',
                                  onChanged: (value) =>
                                      controller.onChangeUser(bairro: value)),
                              RegisterInput(
                                  label: 'CEP',
                                  placeholder: 'Informe seu cep',
                                  onChanged: (value) =>
                                      controller.onChangeUser(cep: value)),
                              RegisterInput(
                                  label: 'NUMERO',
                                  placeholder: 'Informe numero do lote',
                                  onChanged: (value) => controller.onChangeUser(
                                      numero: int.parse(value))),
                              RegisterInput(
                                  label: 'COMPLEMENTO',
                                  placeholder: 'Informação complementar',
                                  onChanged: (value) => controller.onChangeUser(
                                      complemento: value)),
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
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      height: 50,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.red,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                side: BorderSide(
                                                    color: Colors.red,
                                                    width: 2))),
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  side: BorderSide(
                                                      color: Colors.green,
                                                      width: 2))),
                                          child: Text(
                                            'CONFIRMAR',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          onPressed: () {
                                            controller.onSave();
                                            //Get.offNamed(Routes.LOGIN);
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
                  ))
            ],
          ),
        )));
  }
}
