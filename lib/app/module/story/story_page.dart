import 'package:auresgate/app/module/story/story_controller.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:auresgate/app/widgets/appBar_widgets.dart';
import 'package:auresgate/app/widgets/button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryPage extends GetView<StoryController> {
  const StoryPage({Key? key}) : super(key: key);
  void help(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('INFORMAÇÕES'),
            content: Container(
              height: 50,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Resgates Urgentes'),
                      Icon(Icons.circle, color: Colors.red)
                    ],
                  ),
                  Row(
                    children: [
                      Text('Resgates com pouca urgência'),
                      Icon(Icons.circle, color: Colors.green)
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  void onBack() {
    Get.offNamed(Routes.MAIN);
  }

  Future<bool> onWillPop() async {
    print(Get.currentRoute == Routes.STORY);
    if (Get.currentRoute == Routes.STORY) {
      Get.offNamed(Routes.MAIN);
    }
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppPageBarWidget(
          title: 'Histórico de ocorrências',
          onBack: onBack,
          hasIcon: true,
        ),
        body: Obx(() => ListView(
              children: [...controller.listStory(context: context)],
            )),
        floatingActionButton: ButtonWidget(
          buttonText: 'Voltar',
          isBack: true,
          onPressed: () => Get.offNamed(Routes.MAIN),
        ),
      ),
    );
  }
}
