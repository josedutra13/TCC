import 'package:auresgate/app/module/alter_pass/alter_pass_controller.dart';
import 'package:get/get.dart';

class AlterPassBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlterPassController>(() => AlterPassController());
  }
}
