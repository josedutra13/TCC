import 'package:auresgate/app/data/models/DTO/userDTO_model.dart';
import 'package:auresgate/app/data/repository/login_repository.dart';
import 'package:auresgate/app/module/recover_pass/recover_pass_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlterPassController extends GetxController {
  final RecoverPassController _recoverPassController = Get.find();

  final TextEditingController passwordText = TextEditingController();
  final TextEditingController confirmPassText = TextEditingController();

  final LoginRepository _loginRepository;

  AlterPassController(this._loginRepository);
  final _showPassword = false.obs;
  set showPassword(bool value) => this._showPassword.value = value;
  bool get showPassword => this._showPassword.value;

  void changePassword(BuildContext context) async {
    if (passwordText.text == confirmPassText.text) {
      await _loginRepository.changePass(
          _recoverPassController.userDto, passwordText.text);
      Get.offNamed(Routes.LOGIN);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: AlertDialog(
                content: Container(
                    height: 20,
                    child: Row(
                      children: [
                        Text('Senhas não coincidem '),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.info,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    )),
              ),
            );
          });
    }
  }
}
