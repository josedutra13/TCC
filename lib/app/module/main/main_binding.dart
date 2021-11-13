import 'package:auresgate/app/data/repository/chamado_repository.dart';
import 'package:auresgate/app/data/repository/login_repository.dart';
import 'package:auresgate/app/module/login/login_controller.dart';
import 'package:auresgate/app/module/main/main_controller.dart';
import 'package:get/get.dart';

class MainBindings implements Bindings {
  final LoginRepository _loginRepository = LoginRepository();
  final ChamadoRepository _chamadoRepository = ChamadoRepository();
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(_chamadoRepository));
    Get.lazyPut(() => LoginController(_loginRepository));
  }
}
