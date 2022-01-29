import 'package:get/get.dart';

import 'register_address_controller.dart';

class RegisterAddressBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterAddressController>(() => RegisterAddressController());
  }
}
