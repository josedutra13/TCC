import 'package:auresgate/app/data/models/cidade_model.dart';
import 'package:auresgate/app/data/models/endereco_model.dart';
import 'package:auresgate/app/data/models/estado_model.dart';
import 'package:auresgate/app/module/login/login_page.dart';
import 'package:auresgate/app/module/register/register_controller.dart';
import 'package:auresgate/app/module/register/widgets/radio_button_widget.dart';
import 'package:auresgate/app/input_widgets/register_input.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends GetView<RegisterController> {
  List<DropdownMenuItem<String>> statesOptions(List<Estado> states) {
    List<DropdownMenuItem<String>> list = [];

    for (Estado state in states) {
      list.add(DropdownMenuItem<String>(
          value: state.id.toString(), child: Text(state.nome)));
    }

    return list;
  }

  List<DropdownMenuItem<String>> cityOptions(List<Cidade> citys) {
    List<DropdownMenuItem<String>> list = [];

    for (Cidade city in citys) {
      list.add(DropdownMenuItem<String>(
          value: city.id.toString(), child: Text(city.nome)));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[300],
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
                              Obx(() => SelectInput(
                                    label: 'ESTADO',
                                    placeholder: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Selecione uma estado',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    dropDownvalue: controller.isSelectedState
                                        ? controller.selectedStates.id
                                            .toString()
                                        : null,
                                    onChanged: (value) {
                                      controller.selectedState(value);
                                    },
                                    items: statesOptions(controller.states),
                                  )),
                              Obx(() => SelectInput(
                                  label: 'CIDADE',
                                  placeholder: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text('Selecione uma cidade',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                        )),
                                  ),
                                  dropDownvalue: controller.isSelectedState &&
                                          controller.isSelectedCity
                                      ? controller.selectedCity.id.toString()
                                      : null,
                                  onChanged: (value) {
                                    controller.selectedCitys(value);
                                    controller.onChangeUser(
                                        cidade: int.parse(value!));
                                  },
                                  items: controller.isSelectedState
                                      ? cityOptions(controller.citys)
                                      : null)),
                              RegisterInput(
                                  label: 'BAIRRO',
                                  placeholder: 'Informe seu bairro',
                                  onChanged: (value) =>
                                      controller.onChangeUser(bairro: value)),
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
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  children: [
                                    IdadeInput(
                                        label: 'Idade',
                                        isPerson: controller.isPessoa,
                                        isPersonSelected: controller.isPessoa,
                                        placeholder: 'Idade',
                                        onChanged: (value) {
                                          controller.onChangeUser(
                                              idade: int.parse(value));
                                        }),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: SexInput(
                                          items: controller.sex,
                                          label: 'Sexo',
                                          isPerson: controller.isPessoa,
                                          onChanged: (value) {
                                            controller.selectedSexValue =
                                                value.toString();
                                            controller.onChangeUser(
                                                sexo: value);
                                          },
                                          dropDownvalue:
                                              controller.selectedSexValue,
                                        ))
                                  ],
                                ),
                              ),
                              Obx(() => Row(
                                    children: [
                                      RadioButton(
                                        groupT: controller.optUsers,
                                        value: 1,
                                        text: 'ONG',
                                        onChanged: (value) {
                                          controller.optUsers = value;
                                          controller.isPessoa = false;
                                        },
                                      ),
                                      RadioButton(
                                        groupT: controller.optUsers,
                                        value: 2,
                                        text: 'PESSOA',
                                        onChanged: (value) {
                                          controller.optUsers = value;
                                          controller.isPessoa = true;
                                        },
                                      )
                                    ],
                                  )),
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
