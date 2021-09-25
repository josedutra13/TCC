import 'package:auresgate/app/module/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends GetView<RegisterController> {
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
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Informe seu e-mail',
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
                      'SENHA',
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
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Informe sua senha',
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      'CONFIRMAR SENHA',
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
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Informe sua senha',
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      'ENDEREÇO',
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
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Informe sua senha',
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      'SENHA',
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
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Informe sua senha',
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        child: Text('Confirmar'),
                        onPressed: () {},
                      )),
                      Expanded(
                          child: ElevatedButton(
                        child: Text('Cancelar'),
                        onPressed: () {},
                      ))
                    ],
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
