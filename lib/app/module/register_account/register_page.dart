import 'package:auresgate/app/data/models/cidade_model.dart';
import 'package:auresgate/app/data/models/estado_model.dart';

import 'package:auresgate/app/input_widgets/register_input.dart';
import 'package:auresgate/app/module/register_account/register_controller.dart';
import 'package:auresgate/app/module/register_account/widgets/radio_button_widget.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:auresgate/app/widgets/appBar_widgets.dart';
import 'package:auresgate/app/widgets/button_widgets.dart';
import 'package:auresgate/app/widgets/inputs_widgets.dart';
import 'package:auresgate/app/widgets/title_register.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';
import '../../../colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends GetView<RegisterController> {
  //STATE OPTIONS -------------------

  List<DropdownMenuItem<String>> statesOptions(List<Estado> states) {
    List<DropdownMenuItem<String>> list = [];

    for (Estado state in states) {
      list.add(DropdownMenuItem<String>(
          value: state.id.toString(), child: Text(state.nome)));
    }

    return list;
  }

  // CITY OPTIONS ------------------

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
    // const double thumbRadius = 12;
    // const double tickMarkRadius = 8;

    return Scaffold(
        appBar: AppPageBarWidget(
          isMenu: false,
          onBack: () => Get.back(),
          title: 'Cadastro',
        ),
        body: Obx(() => Theme(
              data: Theme.of(context),
              child: Stepper(
                steps: _constructStep(),
                currentStep: controller.currentStep,
                onStepContinue: () {
                  List<Function> functions = [
                    controller.saveStep1,
                    controller.saveStep2,
                    controller.saveStep3
                  ];
                  functions[controller.currentStep](context);
                },
                onStepCancel: () {
                  controller.currentStep = controller.currentStep > 0
                      ? controller.currentStep - 1
                      : 0;
                  controller.isTheLast = false;
                },
                controlsBuilder: (context, details) {
                  return Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Column(
                      children: [
                        ButtonWidget(
                          buttonText:
                              controller.isTheLast ? 'Confirmar' : 'Próximo',
                          onPressed: details.onStepContinue,
                        ),
                        ButtonWidget(
                          buttonText: 'Voltar',
                          isBack: true,
                          onPressed: details.onStepCancel,
                        )
                      ],
                    ),
                  );
                },
                type: StepperType.horizontal,
                elevation: 0,
              ),
            )));

    // return Scaffold(
    //     backgroundColor: Colors.cyan[300],
    //     body: SafeArea(
    //         child: SingleChildScrollView(
    //       child: Stack(
    //         children: [

    //                           Obx(() => SelectInput(
    //                                 label: 'ESTADO',
    //                                 placeholder: Padding(
    //                                   padding: const EdgeInsets.only(left: 8.0),
    //                                   child: Text(
    //                                     'Selecione uma estado',
    //                                     style: TextStyle(
    //                                         color: Colors.grey,
    //                                         fontSize: 16,
    //                                         fontWeight: FontWeight.w600),
    //                                   ),
    //                                 ),
    //                                 dropDownvalue: controller.isSelectedState
    //                                     ? controller.selectedStates.id
    //                                         .toString()
    //                                     : null,
    //                                 onChanged: (value) {
    //                                   controller.selectedState(value);
    //                                 },
    //                                 items: statesOptions(controller.states),
    //                               )),
    //                           Obx(() => SelectInput(
    //                               label: 'CIDADE',
    //                               placeholder: Padding(
    //                                 padding: const EdgeInsets.only(left: 8.0),
    //                                 child: Text(
    //                                   'Selecione uma cidade',
    //                                   style: TextStyle(
    //                                       color: Colors.grey,
    //                                       fontSize: 16,
    //                                       fontWeight: FontWeight.w600),
    //                                 ),
    //                               ),
    //                               dropDownvalue: controller.isSelectedState &&
    //                                       controller.isSelectedCity
    //                                   ? controller.selectedCity.id.toString()
    //                                   : null,
    //                               onChanged: (value) {
    //                                 controller.selectedCitys(value);
    //                                 controller.onChangeUser(
    //                                     cidade: int.parse(value!));
    //                               },
    //                               items: controller.isSelectedState
    //                                   ? cityOptions(controller.citys)
    //                                   : null)),
    //                           RegisterInput(
    //                               label: 'BAIRRO',
    //                               placeholder: 'Informe seu bairro',
    //                               onChanged: (value) =>
    //                                   controller.onChangeUser(bairro: value)),
    //                           RegisterInput(
    //                               label: 'NUMERO',
    //                               placeholder: 'Informe numero do lote',
    //                               onChanged: (value) => controller.onChangeUser(
    //                                   numero: int.parse(value))),
    //                           RegisterInput(
    //                               label: 'COMPLEMENTO',
    //                               placeholder: 'Informação complementar',
    //                               onChanged: (value) => controller.onChangeUser(
    //                                   complemento: value)),
    //                           CNPJInput(
    //                               label: 'CNPJ',
    //                               isOng: controller.isOng,
    //                               placeholder: 'Informe o CNPJ',
    //                               onChanged: (value) =>
    //                                   controller.onChangeUser(cnpj: value)),
    //                           Padding(
    //                             padding: const EdgeInsets.only(top: 2.0),
    //                             child: Row(
    //                               children: [
    //                                 IdadeInput(
    //                                     label: 'Idade',
    //                                     isPerson: controller.isPessoa,
    //                                     isPersonSelected: controller.isPessoa,
    //                                     placeholder: 'Idade',
    //                                     onChanged: (value) =>
    //                                         controller.onChangeUser(
    //                                             idade: int.parse(value))),
    //                                 Padding(
    //                                     padding: const EdgeInsets.only(
    //                                         left: 10.0, bottom: 3.0, top: 5),
    //                                     child: SexInput(
    //                                       items: controller.sex,
    //                                       label: 'Sexo',
    //                                       isPerson: controller.isPessoa,
    //                                       onChanged: (value) {
    //                                         controller.selectedSexValue =
    //                                             value.toString();
    //                                         controller.onChangeUser(
    //                                             sexo: value);
    //                                       },
    //                                       dropDownvalue:
    //                                           controller.selectedSexValue,
    //                                     ))
    //                               ],
    //                             ),
    //                           ),
    //                           Obx(() => Row(
    //                                 children: [
    //                                   RadioButton(
    //                                     groupT: controller.optUsers,
    //                                     value: 1,
    //                                     text: 'ONG',
    //                                     onChanged: (value) {
    //                                       controller.optUsers = value;
    //                                       controller.isPessoa = false;
    //                                       controller.isOng = true;
    //                                     },
    //                                   ),
    //                                   RadioButton(
    //                                     groupT: controller.optUsers,
    //                                     value: 2,
    //                                     text: 'PESSOA',
    //                                     onChanged: (value) {
    //                                       controller.optUsers = value;
    //                                       controller.isPessoa = true;
    //                                       controller.isOng = false;
    //                                     },
    //                                   )
    //                                 ],
    //                               )),
    //                           Padding(
    //                             padding: const EdgeInsets.only(
    //                                 top: 10.0, bottom: 20),
    //                             child: Row(
    //                               mainAxisAlignment:
    //                                   MainAxisAlignment.spaceBetween,
    //                               children: [
    //                                 Expanded(
    //                                     child: Container(
    //                                   height: 50,
    //                                   child: ElevatedButton(
    //                                     style: ElevatedButton.styleFrom(
    //                                         primary: Colors.red,
    //                                         shape: RoundedRectangleBorder(
    //                                             borderRadius:
    //                                                 BorderRadius.circular(30.0),
    //                                             side: BorderSide(
    //                                                 color: Colors.red,
    //                                                 width: 2))),
    //                                     child: Text(
    //                                       'CANCELAR',
    //                                       style: TextStyle(fontSize: 20),
    //                                     ),
    //                                     onPressed: () {
    //                                       Get.offNamed(Routes.LOGIN);
    //                                     },
    //                                   ),
    //                                 )),
    //                                 Expanded(
    //                                     child: Padding(
    //                                   padding: const EdgeInsets.only(left: 5.0),
    //                                   child: Container(
    //                                     height: 50,
    //                                     child: ElevatedButton(
    //                                       style: ElevatedButton.styleFrom(
    //                                           primary: Colors.green,
    //                                           shape: RoundedRectangleBorder(
    //                                               borderRadius:
    //                                                   BorderRadius.circular(
    //                                                       30.0),
    //                                               side: BorderSide(
    //                                                   color: Colors.green,
    //                                                   width: 2))),
    //                                       child: Text(
    //                                         'CONFIRMAR',
    //                                         style: TextStyle(fontSize: 20),
    //                                       ),
    //                                       onPressed: () {
    //                                         controller.onSave();
    //                                         //Get.offNamed(Routes.LOGIN);
    //                                       },
    //                                     ),
    //                                   ),
    //                                 ))
    //                               ],
    //                             ),
    //                           )
    //                         ],
    //                       )),
    //                 ),
    //               ))
    //         ],
    //       ),
    //     )));
  }

  List<Step> _constructStep() {
    List<Step> steps = [
      Step(
          isActive: controller.currentStep >= 0,
          state: controller.currentStep > 0
              ? StepState.complete
              : StepState.indexed,
          title: Text(''),
          content: Form(
            key: controller.formData,
            child: Column(
              children: [
                Center(
                    child:
                        TitleRegister(title: 'Informações de acesso a conta')),
                DropDownInput(
                  labelText: 'Selecione o tipo de conta',
                  items: controller.typeAccount.map((e) {
                    return DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.accountTypeController.text = value.toString();
                    if (controller.accountTypeController.text ==
                        'Pessoa Fisica') {
                      controller.isPessoa = true;
                    } else {
                      controller.isPessoa = false;
                    }
                  },
                ),
                MainInput(
                  labelText: 'Usuário',
                  controller: controller.usernameController,
                  validator: (username) {
                    if (username!.isEmpty) {
                      return 'Informe seu username';
                    } else if (username.length < 4) {
                      return 'Informe um username maior';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    controller.onChangeUser(nomeUsuario: value);
                  },
                ),
                MainInput(
                  labelText: 'Senha',
                  controller: controller.passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Digite uma senha!';
                    } else if (value.length < 8) {
                      return 'Senha muito pequena!';
                    } else {
                      return null;
                    }
                  },
                  isPassword: true,
                  onChanged: (value) {
                    controller.onChangeUser(senha: value);
                  },
                ),
                MainInput(
                  labelText: 'Confirme sua senha',
                  controller: controller.confirmController,
                  obscureText: controller.showPass,
                  isPassword: true,
                  onTap: () {
                    controller.showPass = !controller.showPass;
                  },
                  showPass: controller.showPass,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Digite sua confirmação de senha!';
                    } else if (value != controller.passwordController.text) {
                      return 'Valor diferente da senha informada no campo anterior!';
                    } else {
                      return null;
                    }
                  },
                ),
              ],
            ),
          )),
      Step(
        isActive: controller.currentStep >= 1,
        state:
            controller.currentStep > 1 ? StepState.complete : StepState.indexed,
        title: Text(''),
        content: Form(
          key: controller.formDataRegister,
          child: Column(
            children: [
              Center(child: TitleRegister(title: 'Informações de cadastro')),
              MainInput(
                labelText: 'Nome',
                controller: controller.nameController,
                onChanged: (value) {
                  controller.onChangeUser(nome: value);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe um nome';
                  } else if (value.length < 3) {
                    return 'Digite um nome valido';
                  } else {
                    return null;
                  }
                },
              ),

              //Se for pessoa mostra idade e sexo
              controller.isPessoa
                  ? Row(
                      children: [
                        MainInput(
                          labelText: 'Idade',
                          width: 152,
                          controller: controller.ageController,
                          onChanged: (value) {
                            controller.onChangeUser(nome: value);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            width: 152,
                            height: 57,
                            child: DropdownButtonFormField(
                              items: controller.sex.map((e) {
                                return DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                );
                              }).toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Informe o tipo de conta';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'Sexo',
                                  labelStyle: GoogleFonts.titilliumWeb(
                                      color: Colors.grey.shade400,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: MainColors.primaryColor)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: MainColors.primaryColor))),
                              onChanged: (value) {
                                controller.sexController.text =
                                    value.toString();
                                controller.selectedSexValue = value.toString();
                                controller.onChangeUser(sexo: value.toString());
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  : MainInput(
                      labelText: 'CNPJ',
                      controller: controller.cnpjController,
                      onChanged: (value) {
                        controller.onChangeUser(nome: value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe um nome';
                        } else if (value.length < 3) {
                          return 'Digite um nome valido';
                        } else {
                          return null;
                        }
                      },
                    ),
              MainInput(
                labelText: 'Email',
                controller: controller.emailController,
                onChanged: (value) {
                  controller.onChangeUser(email: value);
                },
                validator: (value) =>
                    Validator.email(value) ? 'Email invalido ' : null,
                keyboardType: TextInputType.emailAddress,
              ),
              MainInput(
                labelText: 'Telefone',
                controller: controller.phoneController,
                onChanged: (value) {
                  controller.onChangeUser(telefone: value);
                },
                validator: (value) =>
                    Validator.phone(value) ? 'Celular invalido' : null,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter()
                ],
              ),
            ],
          ),
        ),
      ),
      Step(
          title: Text(''),
          isActive: controller.currentStep >= 2,
          content: Form(
            key: controller.formAddress,
            child: Column(
              children: [
                TitleRegister(
                  title: 'Informações de localização',
                ),
                DropDownInput(
                    labelText: 'Estado',
                    items: statesOptions(controller.states),
                    onChanged: (value) {
                      controller.stateController.text = value.toString();
                      print(value);
                      controller.selectedState(value);
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Selecione um estado';
                      }
                      return null;
                    }),
                DropDownInput(
                    labelText: 'Cidade',
                    items: Estados.listaEstados.map((e) {
                      return DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.cityController.text = value.toString();
                      controller.selectedCitys(value.toString());
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Selecione um cidade';
                      }
                      return null;
                    }),
                MainInput(
                  labelText: 'Bairro',
                ),
                MainInput(
                  labelText: 'Número',
                )
              ],
            ),
          ))
    ];
    return steps;
  }
}
