import 'package:auresgate/app/module/login/login_controller.dart';
import 'package:auresgate/app/module/request_rescue/request_rescue_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavDrawer extends StatelessWidget {
  final LoginController _loginController = Get.find();
  final String? userName;
  final VoidCallback? onHistory;
  final VoidCallback? logout;

  NavDrawer({Key? key, this.userName, this.onHistory, this.logout});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 30.0),
            child: Container(
              height: 50,
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    size: 45,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 8.0),
                  //   child: Text(
                  //     'Menu',
                  //     style: TextStyle(color: Colors.black, fontSize: 30),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(_loginController.usuarioText.text),
              onTap: () => {},
            ),
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Histórico de Ocorrências'),
            onTap: onHistory,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: logout,
          ),
        ],
      ),
    );
  }
}
