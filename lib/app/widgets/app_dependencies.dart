import 'package:auresgate/app/data/models/DTO/userDTO_model.dart';
import 'package:flutter/cupertino.dart';

class AppDependencies extends InheritedWidget {
  final UserDTO userDTO;

  @override
  final Widget child;
  AppDependencies({required this.child, required this.userDTO})
      : super(child: child);

  static AppDependencies of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppDependencies>()!;
  }

  @override
  bool updateShouldNotify(covariant AppDependencies oldWidget) {
    // TODO: implement updateShouldNotify
    return userDTO != oldWidget.userDTO;
  }
}
