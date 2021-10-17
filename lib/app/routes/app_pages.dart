import 'package:auresgate/app/module/login/login_binding.dart';
import 'package:auresgate/app/module/login/login_page.dart';
import 'package:auresgate/app/module/main/main_binding.dart';
import 'package:auresgate/app/module/main/main_page.dart';
import 'package:auresgate/app/module/register/register_binding.dart';
import 'package:auresgate/app/module/register/register_page.dart';
import 'package:auresgate/app/module/request_rescue/request_rescue_binding.dart';
import 'package:auresgate/app/module/request_rescue/request_rescue_page.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: Routes.LOGIN, page: () => LoginPage(), binding: LoginBindings()),
    GetPage(
        name: Routes.REGISTER,
        page: () => RegisterPage(),
        binding: RegisterBindings()),
    GetPage(
        name: Routes.MAIN,
        page: () => MapPage(),
        binding: RequestRescueBinding()),
    GetPage(
        name: Routes.REQUEST_RESCUE,
        page: () => RequestRescue(),
        binding: RequestRescueBinding())
  ];
}
