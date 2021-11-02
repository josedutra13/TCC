import 'package:auresgate/app/module/rescue/rescue_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class RescueBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RescueController>(() => RescueController());
  }
}
