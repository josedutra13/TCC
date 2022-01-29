import 'package:auresgate/app/data/models/DTO/userDTO_model.dart';
import 'package:auresgate/app/data/repository/login_repository.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginRepository _loginRepository;
  LoginController(this._loginRepository);
  final _onFocusLogin = false.obs;
  bool get onFocusLogin => _onFocusLogin.value;
  set onFocusLogin(bool value) => _onFocusLogin.value = value;

  final _onFocusPass = false.obs;
  bool get onFocusPass => _onFocusPass.value;
  set onFocusPass(bool value) => _onFocusPass.value = value;

  final _userDto = UserDTO.empty().obs;
  UserDTO get userDto => _userDto.value;

  final _invalidLogin = false.obs;
  bool get invalidLogin => _invalidLogin.value;
  set invalidLogin(bool value) => _invalidLogin.value = value;

  TextEditingController usuarioText = TextEditingController();
  TextEditingController senhaText = TextEditingController();
  final formLogin = GlobalKey<FormState>();

  void loginUser(BuildContext context) async {
    var response =
        await _loginRepository.login(usuarioText.text, senhaText.text);

    if (response != null) {
      if (response.id != null) {
        _userDto.value = response;
        Get.toNamed(Routes.MAIN);
      } else {
        _invalidLogin.value = true;
        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return Padding(
        //         padding: const EdgeInsets.only(top: 100.0),
        //         child: AlertDialog(
        //           content: Container(
        //               height: 20,
        //               child: Row(
        //                 children: [
        //                   Text('Usuario ou senha invalido'),
        //                   Padding(
        //                     padding: const EdgeInsets.only(left: 8.0),
        //                     child: Icon(
        //                       Icons.info,
        //                       color: Colors.red,
        //                     ),
        //                   ),
        //                 ],
        //               )),
        //         ),
        //       );
        //     });
      }
    }
  }
}
