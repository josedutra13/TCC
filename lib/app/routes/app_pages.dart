import 'package:auresgate/app/module/alter_pass/alter_pass_binding.dart';
import 'package:auresgate/app/module/alter_pass/alter_pass_page.dart';
import 'package:auresgate/app/module/login/login_binding.dart';
import 'package:auresgate/app/module/login/login_page.dart';
import 'package:auresgate/app/module/main/main_page.dart';
import 'package:auresgate/app/module/recover_pass/recover_pass_binding.dart';
import 'package:auresgate/app/module/recover_pass/recover_pass_page.dart';
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
        binding: RequestRescueBinding()),
    GetPage(
        name: Routes.RECOVER_PASS,
        page: () => RecoverPassPage(),
        binding: RecoverPassBinding()),
    GetPage(
        name: Routes.ALTER_PASS,
        page: () => AlterPassPage(),
        binding: AlterPassBinding()),
  ];
}
