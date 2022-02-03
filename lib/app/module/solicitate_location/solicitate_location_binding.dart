import 'package:auresgate/app/data/repository/chamado_repository.dart';
import 'package:auresgate/app/data/repository/login_repository.dart';
import 'package:auresgate/app/module/edit_rescue/edit_rescue_controller.dart';
import 'package:auresgate/app/module/login/login_controller.dart';
import 'package:auresgate/app/module/main/main_controller.dart';
import 'package:auresgate/app/module/request_rescue/request_rescue_controller.dart';
import 'package:auresgate/app/module/rescue/rescue_controller.dart';
import 'package:auresgate/app/module/solicitate_location/solicitate_location_controller.dart';
import 'package:get/get.dart';

class SolicitateLocationBindings implements Bindings {
  final LoginRepository _loginRepository = LoginRepository();
  final ChamadoRepository _chamadoRepository = ChamadoRepository();
  @override
  void dependencies() {
    Get.lazyPut(() => SolicitateLocationController());
    Get.lazyPut(() => MainController(_chamadoRepository));
    Get.lazyPut(() => EditRescueController());
    Get.lazyPut(() => LoginController(_loginRepository));
    Get.lazyPut(() => RescueController());
    Get.lazyPut(() => RequestRescueController(_chamadoRepository));
  }
}
