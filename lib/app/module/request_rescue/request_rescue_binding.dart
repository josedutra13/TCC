import 'package:auresgate/app/data/repository/login_repository.dart';
import 'package:auresgate/app/module/login/login_controller.dart';
import 'package:auresgate/app/module/request_rescue/request_rescue_controller.dart';
import 'package:get/get.dart';

class RequestRescueBinding implements Bindings {
  LoginRepository _loginRepository = LoginRepository();
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(_loginRepository));
    Get.lazyPut<RequestRescueController>(() => RequestRescueController());
  }
}
