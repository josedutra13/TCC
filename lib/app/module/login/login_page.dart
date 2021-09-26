import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  var theme = Theme.of(context);
    return Scaffold(
      body: ListView(
        children: [
        Stack(
          children: [
            Image.asset('assets/images/fundo.jpeg'),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width *0.8,
                    height: MediaQuery.of(context).size.height *0.8,
                    child: Container(
                        width: 300,
                        height: 300,
                        child:Image.asset('assets/images/logo.png'),
                      ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 350, left: 35, right: 20),
          
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                   
                   Padding(
              padding: const EdgeInsets.only(left:65,top: 150), 
                
          ),  Text(
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
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Informe seu usuário',
                          //TODO ALINHAR PLACEHOLDER
                          hintStyle: TextStyle(fontWeight: FontWeight.w300),
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                     Text(
                          'SENHA',
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
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Informe sua senha',
                          hintStyle: TextStyle(fontWeight: FontWeight.w300),
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                        ),
                      ),
                    ),
            
                    
                 ],),
              ),
          ],
          ),],
          ),
          
    );
  }
}