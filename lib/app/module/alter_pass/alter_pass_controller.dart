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
  final formAlter = GlobalKey<FormState>();

  final LoginRepository _loginRepository;

  AlterPassController(this._loginRepository);
  final _showPassword = false.obs;

  get formAlterPass => null;
  set showPassword(bool value) => this._showPassword.value = value;
  bool get showPassword => this._showPassword.value;

  final _showConfirmPassword = false.obs;
  set showConfirmPassword(bool value) =>
      this._showConfirmPassword.value = value;
  bool get showConfirmPassword => this._showConfirmPassword.value;

  void changePassword() async {
    if (formAlter.currentState!.validate()) {
      await _loginRepository.changePass(
          _recoverPassController.userDto, passwordText.text);
      Get.offNamed(Routes.SUCCESSPAGE,
          arguments: 'Senha alterada \n com sucesso');
      Future.delayed(Duration(seconds: 3), () {
        Get.offNamed(Routes.LOGIN);
      });
    }
  }
}
