import 'package:auresgate/app/module/edit_rescue/edit_rescue_controller.dart';
import 'package:get/get.dart';

class EditRescueBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditRescueController>(() => EditRescueController());
  }
}
