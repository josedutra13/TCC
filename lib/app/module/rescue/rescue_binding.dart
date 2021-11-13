import 'package:auresgate/app/data/repository/chamado_repository.dart';
import 'package:auresgate/app/module/main/main_controller.dart';
import 'package:auresgate/app/module/rescue/rescue_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class RescueBinding implements Bindings {
  final ChamadoRepository _chamadoRepository = ChamadoRepository();
  @override
  void dependencies() {
    Get.lazyPut<RescueController>(() => RescueController());
    Get.lazyPut<MainController>(() => MainController(_chamadoRepository));
  }
}
