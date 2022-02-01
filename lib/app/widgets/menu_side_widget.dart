import 'package:auresgate/colors.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  final String userName;
  final VoidCallback? onHistory;
  final VoidCallback? logout;

  NavDrawer({Key? key, required this.userName, this.onHistory, this.logout});

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
                    Icons.close,
                    size: 30,
                    color: MainColors.primaryColor,
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
            padding: const EdgeInsets.only(
              top: 20.0,
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Usuário',
                    style:
                        TextStyle(color: MainColors.primaryColor, fontSize: 12),
                  ),
                  subtitle: Text(
                    userName,
                    style:
                        TextStyle(color: MainColors.blackColor, fontSize: 18),
                  ),
                  onTap: () => {},
                ),
                ListTile(
                  title: Text(
                    'Histórico',
                    style:
                        TextStyle(color: MainColors.primaryColor, fontSize: 12),
                  ),
                  subtitle: Text('Ocorrências',
                      style: TextStyle(
                          color: MainColors.blackColor, fontSize: 18)),
                  onTap: onHistory,
                ),
                ListTile(
                  title: Text(
                    'Sair',
                    style:
                        TextStyle(color: MainColors.blackColor, fontSize: 18),
                  ),
                  onTap: logout,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
