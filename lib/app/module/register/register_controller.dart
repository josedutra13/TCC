import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

  final TextEditingController passwordController =
    TextEditingController();
  final TextEditingController confirmController =
      TextEditingController();


   final _showPassword = false.obs;
   bool get showPassword => _showPassword.value;
   set showPassword(bool value) => _showPassword.value = value;
  
}
