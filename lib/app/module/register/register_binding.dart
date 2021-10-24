import 'package:auresgate/app/data/repository/person_repository.dart';
import 'package:auresgate/app/module/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBindings implements Bindings {
  final PersonsRepository _personsRepository = PersonsRepository();
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController(_personsRepository));
  }
}
