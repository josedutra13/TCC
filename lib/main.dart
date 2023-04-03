import 'package:auresgate/app/data/models/DTO/userDTO_model.dart';
import 'package:auresgate/app/routes/app_pages.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:auresgate/app/theme/theme_widget.dart';
import 'package:auresgate/app/widgets/app_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(Main(userDTO: UserDTO()));
}

class Main extends StatelessWidget {
  final UserDTO userDTO;
  const Main({Key? key, required this.userDTO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: AppDependencies(
        userDTO: userDTO,
        child: GetMaterialApp(
          debugShowMaterialGrid: false,
          debugShowCheckedModeBanner: false,
          title: 'AuResgate',
          getPages: AppPages.routes,
          initialRoute: Routes.LOGIN,
          theme: mainTheme,
        ),
      ),
    );
  }
}
