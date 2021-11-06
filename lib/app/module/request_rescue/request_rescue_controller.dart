import 'package:auresgate/app/data/models/animal_model.dart';
import 'package:get/get.dart';

class RequestRescueController extends GetxController {
  final _animal = Animal.empty().obs;
  Animal get animal => _animal.value;

  final _animalEditing = Animal.empty().obs;
  Animal get animalEditing => _animalEditing.value;

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
    _animalEditing.value = animalEditing.copyWith(
        estado: estado,
        descricao: descricao,
        latitude: latitude,
        longitude: longitude);
  }
}
