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
        body: SafeArea(
      child:ListView(
        children: [
         Stack(
        children: [
          Image.asset('assets/images/fundo.png'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:2.0),
                //TODO 
                child: Text('CADASTRAR',style: GoogleFonts.bebasNeue(color: Colors.white,fontSize: 50 )),
              ),
            ],),
          Container(
            width: MediaQuery.of(context).size.width * 1.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
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
                      'Telefone',
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
                  Row(children: [RadioButton(groupT: 1,text: 'ONG',),RadioButton(groupT: 2,text: 'PESSOA',)],),
                  Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      
                         Expanded(
                              child: Container(
                                height:50,
                           child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.red,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: Colors.red,width: 2) )),
                            child: Text('CANCELAR',style: TextStyle(fontSize: 20),),
                            onPressed: () {},
                          ),
                              )),
                        
                        
                        Expanded(
                          child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Container(
                            height: 50,
                            child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: Colors.green,width: 2))),
                            child: Text('CONFIRMAR',style: TextStyle(fontSize: 20),),
                            onPressed: () {
                              Get.offNamed(Routes.LOGIN);
                            },
                        ),
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
      ],) 
      
    ));
  }
}
