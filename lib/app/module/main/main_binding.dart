import 'package:auresgate/app/data/repository/chamado_repository.dart';
import 'package:auresgate/app/data/repository/login_repository.dart';
import 'package:auresgate/app/module/login/login_controller.dart';
import 'package:auresgate/app/module/request_rescue/request_rescue_controller.dart';
import 'package:get/get.dart';

class MenuBindings implements Bindings {
  final LoginRepository _loginRepository = LoginRepository();
   final ChamadoRepository _chamadoRepository = ChamadoRepository();
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(_loginRepository));
    Get.lazyPut(() => RequestRescueController(_chamadoRepository));
  }
}
