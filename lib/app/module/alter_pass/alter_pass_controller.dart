import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AlterPassController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
// final MyRepository repository;
// MyController(this.repository);

  final _showPassoword = false.obs;
  set showPassoword(bool value) => this._showPassoword.value = value;
  bool get showPassoword => this._showPassoword.value;
}
