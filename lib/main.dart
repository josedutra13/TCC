import 'package:auresgate/app/routes/app_pages.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:auresgate/app/theme/theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GestureDetector(
    onTap: () {
      FocusManager.instance.primaryFocus?.unfocus();
    },
    child: GetMaterialApp(
      title: 'AuResgate',
      getPages: AppPages.routes,
      initialRoute: Routes.LOGIN,
      theme: ThemeData(
          primaryColor: Colors.blueAccent,
          backgroundColor: Colors.blueAccent.shade200),
    ),
  ));
}
