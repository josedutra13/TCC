
import 'package:auresgate/app/module/story/story_controller.dart';
import 'package:get/get.dart';

class StoryBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<StoryController>(() => StoryController(
     ));
  }
}