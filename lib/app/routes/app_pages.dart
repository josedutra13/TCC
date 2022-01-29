import 'package:auresgate/app/module/alter_pass/alter_pass_binding.dart';
import 'package:auresgate/app/module/alter_pass/alter_pass_page.dart';
import 'package:auresgate/app/module/edit_rescue/edit_rescue_binding.dart';
import 'package:auresgate/app/module/edit_rescue/edit_rescue_page.dart';
import 'package:auresgate/app/module/finish_rescue/finish_rescue_binding.dart';
import 'package:auresgate/app/module/finish_rescue/finish_rescue_page.dart';
import 'package:auresgate/app/module/login/login_binding.dart';
import 'package:auresgate/app/module/login/login_page.dart';
import 'package:auresgate/app/module/main/main_binding.dart';
import 'package:auresgate/app/module/main/main_page.dart';
import 'package:auresgate/app/module/recover_pass/recover_pass_binding.dart';
import 'package:auresgate/app/module/recover_pass/recover_pass_page.dart';
import 'package:auresgate/app/module/register_account/register_binding.dart';
import 'package:auresgate/app/module/register_account/register_page.dart';
import 'package:auresgate/app/module/request_rescue/request_rescue_binding.dart';
import 'package:auresgate/app/module/request_rescue/request_rescue_page.dart';
import 'package:auresgate/app/module/rescue/rescue_binding.dart';
import 'package:auresgate/app/module/rescue/rescue_page.dart';
import 'package:auresgate/app/module/solicitate_location/solicitate_location_page.dart';
import 'package:auresgate/app/module/solicitate_location/solicitate_location_binding.dart';
import 'package:auresgate/app/module/story/story_binding.dart';
import 'package:auresgate/app/module/story/story_page.dart';
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
    GetPage(name: Routes.MAIN, page: () => MainPage(), binding: MainBindings()),
    GetPage(
        name: Routes.REQUEST_RESCUE,
        page: () => RequestRescuePage(),
        binding: RequestRescueBinding()),
    GetPage(
        name: Routes.RECOVER_PASS,
        page: () => RecoverPassPage(),
        binding: RecoverPassBinding()),
    GetPage(
        name: Routes.ALTER_PASS,
        page: () => AlterPassPage(),
        binding: AlterPassBinding()),
    GetPage(
        name: Routes.RESCUE,
        page: () => RescuePage(),
        binding: RescueBinding()),
    GetPage(
        name: Routes.SOLICITATE_LOCATION,
        page: () => SolicitateLocationPage(),
        binding: SolicitateLocationBindings()),
    GetPage(
        name: Routes.FINISH_RESCUE,
        page: () => FinishRescuePage(),
        binding: FinishRescueBinding()),
    GetPage(
        name: Routes.EDIT_RESCUE,
        page: () => EditRescuePage(),
        binding: EditRescueBinding()),
    GetPage(
        name: Routes.STORY, page: () => StoryPage(), binding: StoryBinding())
  ];
}
