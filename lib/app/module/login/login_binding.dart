import 'dart:ffi';

import 'package:auresgate/app/module/login/login_controller.dart';
import 'package:auresgate/app/module/register/register_controller.dart';
import 'package:get/get.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
