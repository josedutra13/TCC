import 'package:auresgate/app/data/models/cidade_model.dart';
import 'package:auresgate/app/data/models/estado_model.dart';
import 'package:auresgate/app/module/register_account/register_controller.dart';
import 'package:auresgate/app/widgets/appBar_widgets.dart';
import 'package:auresgate/app/widgets/button_widgets.dart';
import 'package:auresgate/app/widgets/inputs_widgets.dart';
import 'package:auresgate/app/widgets/title_register.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Scaffold(
        appBar: AppPageBarWidget(
          hasIcon: false,
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Center(
                    child:
                        TitleRegister(title: 'Informações de acesso a conta')),
                DropDownInput(
                  labelText: 'Selecione o tipo de conta',
                  validator: (value) {
                    if (value == null) {
                      return 'Informe o tipo de conta';
                    }
                    return null;
                  },
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
                  obscureText: !controller.showPass,
                  onTap: () {
                    controller.showPass = !controller.showPass;
                  },
                  showPass: controller.showPass,
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
                  obscureText: !controller.showConfirmPass,
                  isPassword: true,
                  onTap: () {
                    controller.showConfirmPass = !controller.showConfirmPass;
                  },
                  showPass: controller.showConfirmPass,
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
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        Container(
                          width: 164,
                          child: MainInput(
                            labelText: 'Idade',
                            controller: controller.ageController,
                            onChanged: (value) {
                              controller.onChangeUser(
                                  idade: int.tryParse(value));
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, bottom: 5),
                          child: Container(
                              width: 164,
                              child: DropDownInput(
                                items: controller.sex.map((e) {
                                  return DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  );
                                }).toList(),
                                labelText: 'Sexo',
                                onChanged: (value) {
                                  controller.sexController.text =
                                      value.toString();
                                  controller.selectedSexValue =
                                      value.toString();
                                  controller.onChangeUser(
                                      sexo: value.toString());
                                },
                              )),
                        ),
                      ],
                    )
                  : MainInput(
                      labelText: 'CNPJ',
                      controller: controller.cnpjController,
                      onChanged: (value) {
                        controller.onChangeUser(cnpj: value);
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    items: controller.isSelectedState
                        ? cityOptions(controller.citys)
                        : null,
                    onChanged: (value) {
                      controller.cityController.text = value.toString();
                      controller.selectedCitys(value);
                      controller.onChangeUser(cidade: int.tryParse(value));
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Selecione um cidade';
                      }
                      return null;
                    }),
                MainInput(
                  labelText: 'Bairro',
                  controller: controller.districtController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Digite seu bairro';
                    }
                    return null;
                  },
                  onChanged: (district) {
                    controller.onChangeUser(bairro: district);
                  },
                ),
                MainInput(
                  labelText: 'Número',
                  controller: controller.numberController,
                  onChanged: (number) {
                    controller.onChangeUser(numero: int.tryParse(number));
                  },
                )
              ],
            ),
          ))
    ];
    return steps;
  }
}
