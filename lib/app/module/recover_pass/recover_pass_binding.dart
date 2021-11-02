import 'package:auresgate/app/data/repository/login_repository.dart';
import 'package:auresgate/app/module/recover_pass/recover_pass_controller.dart';
import 'package:get/get.dart';

class RecoverPassBinding implements Bindings {
  final LoginRepository _loginRepository = LoginRepository();
  @override
  void dependencies() {
    Get.lazyPut<RecoverPassController>(
        () => RecoverPassController(_loginRepository));
  }
}
