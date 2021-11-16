import 'package:auresgate/app/data/repository/chamado_repository.dart';
import 'package:auresgate/app/module/edit_rescue/edit_rescue_controller.dart';
import 'package:auresgate/app/module/request_rescue/request_rescue_controller.dart';
import 'package:auresgate/app/module/rescue/rescue_controller.dart';
import 'package:get/get.dart';

class EditRescueBinding implements Bindings {
  final ChamadoRepository _chamadoRepository = ChamadoRepository();
  @override
  void dependencies() {
    Get.lazyPut<EditRescueController>(() => EditRescueController());
    Get.lazyPut<RequestRescueController>(
        () => RequestRescueController(_chamadoRepository));
    Get.lazyPut<RescueController>(() => RescueController());
  }
}
