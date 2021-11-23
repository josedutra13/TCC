import 'package:auresgate/app/widgets/appBar_widgets.dart';
import 'package:flutter/material.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({Key? key}) : super(key: key);
  void help(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('INFORMAÇÕES'),
            content: Container(
              height: 50,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Resgates Urgentes'),
                      Icon(Icons.circle, color: Colors.red)
                    ],
                  ),
                  Row(
                    children: [
                      Text('Resgates com pouca urgência'),
                      Icon(Icons.circle, color: Colors.green)
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[300],
      appBar: AppPageBarWidget(
          onAction: null,
          isMenu: false,
          title: 'HISTÓRICO DE OCORRÊNCIAS',
          titleStyle: TextStyle(fontSize: 15)),
      body: ListView(
        children: [
          
        ],
      ),
    );
  }
}
