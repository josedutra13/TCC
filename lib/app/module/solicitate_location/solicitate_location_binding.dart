import 'package:auresgate/app/data/repository/animal_repository.dart';
import 'package:auresgate/app/data/repository/login_repository.dart';
import 'package:auresgate/app/module/login/login_controller.dart';
import 'package:auresgate/app/module/request_rescue/request_rescue_controller.dart';
import 'package:get/get.dart';

class SolicitateLocationBindings implements Bindings {
  final LoginRepository _loginRepository = LoginRepository();
  final AnimalRepository _animalRepository = AnimalRepository();
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(_loginRepository));
    Get.lazyPut(() => RequestRescueController(_animalRepository));
  }
}
