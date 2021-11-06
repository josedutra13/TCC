import 'package:auresgate/app/data/models/animal_model.dart';
import 'package:auresgate/app/data/models/localizacao_model.dart';
import 'package:auresgate/app/data/repository/animal_repository.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:get/get.dart';

class RequestRescueController extends GetxController {
  final AnimalRepository _animalRepository;

  RequestRescueController(this._animalRepository);
  final _animal = Animal.empty().obs;
  Animal get animal => _animal.value;

  final _animalEditing = Animal.empty().obs;
  Animal get animalEditing => _animalEditing.value;

  final _listAnimalsRescue = <Animal>[].obs;
  List<Animal> get listAnimalsRescue => _listAnimalsRescue.toList();

  final _listLocation = <Localizacao?>[].obs;
  List<Localizacao?> get listLocation => _listLocation.toList();

  final _marking = false.obs;
  set marking(value) => _marking.value = value;
  get marking => this._marking.value;

  final _optUsers = 0.obs;
  get optUsers => this._optUsers.value;
  set optUsers(value) => this._optUsers.value = value;

  void onChangeSolicitation(
      {String? estado,
      String? descricao,
      double? latitude,
      double? longitude}) {
    _animalEditing.value = _animalEditing.value.copyWith(
        estado: estado,
        descricao: descricao,
        latitude: latitude,
        longitude: longitude);

    print('BURRÃO ${_animalEditing.value.descricao}');
  }

  void onConfirmRescue() async {
    _animal.value = _animalEditing.value;
    print('AQUIII $animal');
    var response = await _animalRepository.createAnimal(animal);
    if (response == null) {
      Get.offNamed(Routes.MAIN);
    }
  }

  void loadRescueAnimals() async {
    var response = await _animalRepository.listAnimal();
    print('AQUIII $response');
    _listAnimalsRescue.value = response;
    // _listLocation.value = response.map((e) {
    //   return e.localizacao;
    // }).toList();
  }
}
