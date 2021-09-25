import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Stack(
        children: [
          Image.asset('assets/images/fundo.jpeg'),
          Container(
            width: MediaQuery.of(context).size.width * 1.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 250, left: 20, right: 20),
              child: Form(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'USUÁRIO',
                    style: GoogleFonts.bebasNeue(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Informe seu usuário',
                        hintStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      'E-MAIL',
                      style: GoogleFonts.bebasNeue(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Informe seu e-mail',
                        hintStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                    ),
                  )
                ],
              )),
            ),
          )
        ],
      ),
    ]));
  }
}
