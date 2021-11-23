import 'package:auresgate/app/data/repository/chamado_repository.dart';
import 'package:auresgate/app/data/repository/login_repository.dart';
import 'package:auresgate/app/module/edit_rescue/edit_rescue_controller.dart';
import 'package:auresgate/app/module/login/login_controller.dart';
import 'package:auresgate/app/module/main/main_controller.dart';
import 'package:auresgate/app/module/story/story_controller.dart';
import 'package:get/get.dart';

class StoryBinding implements Bindings {
  LoginRepository _loginRepository = LoginRepository();
  ChamadoRepository _chamadoRepository = ChamadoRepository();
  @override
  void dependencies() {
    Get.lazyPut<StoryController>(() => StoryController());
    Get.lazyPut<LoginController>(() => LoginController(_loginRepository));
    Get.lazyPut<MainController>(() => MainController(_chamadoRepository));
  }
}
