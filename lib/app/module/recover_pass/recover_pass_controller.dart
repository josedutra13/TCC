import 'package:auresgate/app/data/models/DTO/userDTO_model.dart';
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

  final _invalidEmail = false.obs;
  bool get invalidEmail => _invalidEmail.value;
  set invalidEmail(bool value) => _invalidEmail.value = value;

  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  TextEditingController confirmPassText = TextEditingController();
  final formAlter = GlobalKey<FormState>();

  void emailConfirmation(BuildContext context) async {
    var response = await _loginRepository.emailConfirm(emailText.text);
    print('[LOG] :: ${response!.id}');

    if (formAlter.currentState!.validate()) {
      if (response.id != null) {
        _userDto.value = response;

        Get.offNamed(
          Routes.ALTER_PASS,
        );
      } else {
        _invalidEmail.value = true;
      }
    }
  }
}
