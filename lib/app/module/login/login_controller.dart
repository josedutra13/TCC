import 'package:auresgate/app/data/models/DTO/userDTO_model.dart';
import 'package:auresgate/app/data/repository/login_repository.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginRepository _loginRepository;
  LoginController(this._loginRepository);

  final _userDto = UserDTO.empty().obs;
  UserDTO get userDto => _userDto.value;

  final _invalidLogin = false.obs;
  bool get invalidLogin => _invalidLogin.value;
  set invalidLogin(bool value) => _invalidLogin.value = value;

  final _showPass = false.obs;
  bool get showPass => _showPass.value;
  set showPass(bool value) => _showPass.value = value;

  TextEditingController usuarioText = TextEditingController();
  TextEditingController senhaText = TextEditingController();
  final formLogin = GlobalKey<FormState>();

  Future<void> login() async {
    var response =
        await _loginRepository.login(usuarioText.text, senhaText.text);
    if (formLogin.currentState!.validate()) {
      if (response!.id != null) {
        _userDto.value = response;
        Get.toNamed(Routes.MAIN);
      } else {
        _invalidLogin.value = true;
      }
    }
  }
}
