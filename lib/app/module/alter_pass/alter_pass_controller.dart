import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AlterPassController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  final _showPassword = false.obs;
  set showPassword(bool value) => this._showPassword.value = value;
  bool get showPassword => this._showPassword.value;
}
