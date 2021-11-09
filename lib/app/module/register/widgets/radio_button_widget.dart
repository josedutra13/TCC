import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RadioButton extends StatelessWidget {
  final int value;
  final String? text;
  final int groupT;
  final void Function(int?)? onChanged;
  final Color? color;

  var radio;
  RadioButton(
      {Key? key,
      this.radio,
      required this.value,
      this.text,
      required this.groupT,
      this.onChanged,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Radio(
        activeColor: color ?? Colors.white,
        value: value,
        groupValue: groupT,
        onChanged: onChanged,
      ),
      if (text != null)
        Text(text!,
            style: GoogleFonts.roboto(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w900))
    ]);
  }
}
