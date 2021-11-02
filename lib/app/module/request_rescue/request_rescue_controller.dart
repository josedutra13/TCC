import 'package:get/get.dart';

class RequestRescueController extends GetxController {
// final MyRepository repository;
// RequestRescueController(this.repository);

  final _marking = false.obs;
  set marking(value) => _marking.value = value;
  get marking => this._marking.value;

  final _optUsers = 0.obs;
  get optUsers => this._optUsers.value;
  set optUsers(value) => this._optUsers.value = value;

}
