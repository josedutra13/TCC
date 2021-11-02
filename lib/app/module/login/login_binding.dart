import 'package:auresgate/app/data/repository/login_repository.dart';
import 'package:auresgate/app/module/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBindings implements Bindings {
  final LoginRepository _loginRepository = LoginRepository();
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(_loginRepository));

    
  }
}
