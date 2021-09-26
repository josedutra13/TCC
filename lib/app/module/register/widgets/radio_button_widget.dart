import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RadioButton extends StatelessWidget {
  final String? value;
  final String? text;
  final int groupT;
  // final void Function(String?) onChanged;

  var radio;
  RadioButton({ Key? key, this.radio, this.value, this.text, required this.groupT }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    
    var group = groupT;
    return Row(
       children: [Radio(
                    value: 1,groupValue: group,onChanged: (T){},)
                  ,if(text != null)
                  Text(text!,  style: GoogleFonts.bebasNeue(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500))
                  
                  
       ]);
}}