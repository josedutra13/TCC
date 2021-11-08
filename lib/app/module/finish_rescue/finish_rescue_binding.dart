import 'package:auresgate/app/module/finish_rescue/finish_rescue_controller.dart';
import 'package:get/get.dart';

class FinishRescueBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinishRescueController>(() => FinishRescueController());
  }
}
