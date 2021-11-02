import 'package:auresgate/app/data/repository/login_repository.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginRepository _loginRepository;

  final _onCheck = false.obs;

  LoginController(this._loginRepository);
  bool get onCheck => _onCheck.value;
  set onCheck(bool value) => _onCheck.value = value;

  // final String errorMessage = '';

  TextEditingController usuarioText = TextEditingController();
  TextEditingController senhaText = TextEditingController();

  void loginUser(BuildContext context) async {
    var response =
        await _loginRepository.login(usuarioText.text, senhaText.text);

    if (response != null) {
      if (response.id != null) {
        Get.offAllNamed(Routes.MAIN, arguments: response);
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: AlertDialog(
                  content: Container(
                      height: 20,
                      child: Row(
                        children: [
                          Text('Usuario ou senha invalido'),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(
                              Icons.info,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      )),
                ),
              );
            });
      }
    }
  }
}
