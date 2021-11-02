import 'package:auresgate/app/data/models/userDTO_model.dart';
import 'package:auresgate/app/data/repository/login_repository.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverPassController extends GetxController {
  final LoginRepository _loginRepository;

  RecoverPassController(this._loginRepository);
  final _userDto = UserDTO.empty().obs;
  UserDTO get userDto => _userDto.value;

  final _showPassword = false.obs;
  set showPassword(bool value) => this._showPassword.value = value;
  bool get showPassword => this._showPassword.value;

  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  TextEditingController confirmPassText = TextEditingController();

  void emailConfirmation(BuildContext context) async {
    var response = await _loginRepository.emailConfirm(emailText.text);

    if (response != null) {
      print('[LOG] :: ${response.id}');
      if (response.id != null) {
        _userDto.value = response;
        Get.toNamed(Routes.ALTER_PASS);
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
                          Text('Email não encontrado'),
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
}
