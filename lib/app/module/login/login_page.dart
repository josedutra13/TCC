import 'package:auresgate/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fundo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 400,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180, left: 25, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 65, top: 150),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  height: 60,
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_outline,
                        size: 35,
                        color: Colors.grey,
                      ),
                      hintText: 'USUÁRIO',
                      //TODO ALINHAR PLACEHOLDER
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                      fillColor: Colors.white70,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  height: 60,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.lock, size: 35, color: Colors.grey),
                      hintText: 'SENHA',
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                      fillColor: Colors.white70,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ),
                ),
                Obx(() => CheckboxListTile(
                    title: Text(
                      'Manter-me logado',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    tristate: true,
                    contentPadding: EdgeInsets.only(right: 20),
                    value: controller.onCheck,
                    onChanged: (value) {
                      controller.onCheck = !controller.onCheck;
                    },
                    controlAffinity: ListTileControlAffinity.leading)),
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 10),
                  child: Container(
                    width: 250,
                    height: 60,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.offNamed(Routes.MAIN);
                        },
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.grey,
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(color: Colors.green))),
                        child: Text(
                          'ENTRAR',
                          style: TextStyle(fontSize: 30),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 2,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(
                                          color: Colors.white, width: 2))),
                              child: Text('Esqueci a senha',
                                  style: TextStyle(fontSize: 15)),
                              onPressed: () {},
                            )),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: BorderSide(
                                            color: Colors.white, width: 2))),
                                child: Text(
                                  'Cadastrar',
                                  style: TextStyle(fontSize: 15),
                                ),
                                onPressed: () {
                                  Get.offNamed(Routes.REGISTER);
                                },
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
