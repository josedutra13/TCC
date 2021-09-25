import 'package:auresgate/app/module/login/login_page.dart';
import 'package:auresgate/app/module/register/register_page.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.LOGIN, page: () => LoginPage()),
    GetPage(name: Routes.REGISTER, page: () => RegisterPage()),
  ];
}
