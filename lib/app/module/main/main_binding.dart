import 'dart:ffi';
import 'package:auresgate/app/module/main/main_controller.dart';
import 'package:auresgate/app/module/request_rescue/request_rescue_controller.dart';
import 'package:get/get.dart';

class MenuBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RequestRescueController());
  }
}
