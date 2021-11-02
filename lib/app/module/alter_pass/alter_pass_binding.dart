import 'package:auresgate/app/data/repository/login_repository.dart';
import 'package:auresgate/app/module/alter_pass/alter_pass_controller.dart';
import 'package:get/get.dart';

class AlterPassBinding implements Bindings {
  final LoginRepository _loginRepository = LoginRepository();
  @override
  void dependencies() {
    Get.lazyPut<AlterPassController>(
        () => AlterPassController(_loginRepository));
  }
}
