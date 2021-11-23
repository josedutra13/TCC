import 'package:get/get.dart';

class StoryController extends GetxController {


// StoryController(this.repository);

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}