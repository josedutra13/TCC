import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
       children: [Image.asset('assets/images/fundo.jpeg'),
       SizedBox(
         width: MediaQuery.of(context).size.width *0.8,
         height: MediaQuery.of(context).size.height *0.8,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left:60,top: 150), 
              child: Container(
              width: 300,
              height: 300,
              child:Image.asset('assets/images/logo.png'),
            ),
          ),
          
        ],),
       )
       ],
      )
      
    );
  }
}