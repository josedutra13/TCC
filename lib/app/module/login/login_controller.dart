import 'package:get/get.dart';

class LoginController extends GetxController {
  final _onCheck = false.obs;
  bool get onCheck => _onCheck.value;
  set onCheck(bool value) => _onCheck.value = value;
}
