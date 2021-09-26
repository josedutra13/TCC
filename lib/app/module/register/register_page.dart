import 'package:auresgate/app/module/login/login_page.dart';
import 'package:auresgate/app/module/register/register_controller.dart';
import 'package:auresgate/app/module/register/widgets/radio_button_widget.dart';
import 'package:auresgate/app/routes/app_routes.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text('CADASTRAR',style: GoogleFonts.bebasNeue(color: Colors.white,fontSize: 50 )),
              ),
            ],),
          Container(
            width: MediaQuery.of(context).size.width * 1.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
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
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Informe seu usuário',
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
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
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Informe seu e-mail',
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
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
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Informe sua senha',
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
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
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Confirme sua senha',
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      'telefone',
                      style: GoogleFonts.bebasNeue(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Informe seu telefone',
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      'Endereço',
                      style: GoogleFonts.bebasNeue(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Informe seu endereço',
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                    ),
                  ),
                  // Row(children: [RadioButton(groupT: 1,text: 'ONG',),RadioButton(groupT: 2,text: 'PESSOA',)],)
                  Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          child: Text('CANCELAR'),
                          onPressed: () {},
                        )),
                        
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.green, ),
                          child: Text('CONFIRMAR'),
                          onPressed: () {
                            Get.toNamed(Routes.LOGIN);
                          },
                        ),
                            ))
                      ],
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
