import 'package:get/get.dart';

class RequestRescueController extends GetxController {
// final MyRepository repository;
// RequestRescueController(this.repository);

  final _marking = false.obs;
  set marking(value) => _marking.value = value;
  get marking => this._marking.value;
}
