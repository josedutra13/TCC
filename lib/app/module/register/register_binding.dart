import 'package:auresgate/app/data/repository/city_repository.dart';
import 'package:auresgate/app/data/repository/ong_repository.dart';
import 'package:auresgate/app/data/repository/person_repository.dart';
import 'package:auresgate/app/data/repository/state_repository.dart';
import 'package:auresgate/app/module/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBindings implements Bindings {
  final PersonsRepository _personsRepository = PersonsRepository();
  final StatesRepository _statesRepository = StatesRepository();
  final CityRepository _cityRepository = CityRepository();
  final OngRepository _ongRepository = OngRepository();
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController(_personsRepository, _statesRepository,
        _cityRepository, _ongRepository));
  }
}
