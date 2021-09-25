import 'package:auresgate/app/routes/app_pages.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'AuResgate',
    getPages: AppPages.routes,
    initialRoute: Routes.REGISTER,
    theme: ThemeData.light(),
  ));
}
