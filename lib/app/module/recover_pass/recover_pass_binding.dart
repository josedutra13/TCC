import 'package:auresgate/app/module/recover_pass/recover_pass_controller.dart';
import 'package:get/get.dart';

class RecoverPassBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecoverPassController>(() => RecoverPassController());
  }
}
