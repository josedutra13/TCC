import 'package:auresgate/app/module/request_rescue/request_rescue_controller.dart';
import 'package:get/get.dart';

class RequestRescueBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestRescueController>(() => RequestRescueController());
  }
}
