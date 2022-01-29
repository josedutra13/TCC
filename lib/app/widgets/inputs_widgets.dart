import 'package:flutter/services.dart';

import '../../colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainInput extends StatelessWidget {
  final String labelText;
  final Function(String)? onChanged;
  final double? width;
  final double? height;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final bool isPassword;
  final bool showPass;
  final bool isFocus;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final TextInputType? keyboardType;

  const MainInput({
    Key? key,
    required this.labelText,
    this.onChanged,
    this.width,
    this.height,
    this.controller,
    this.inputFormatters,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.isPassword = false,
    this.showPass = false,
    this.onTap,
    this.isFocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // child: Container(
      //   width: width ?? MediaQuery.of(context).size.width * 0.9,
      //   height: 60,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: isFocus
              ? GoogleFonts.titilliumWeb(
                  color: MainColors.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500)
              : GoogleFonts.titilliumWeb(
                  color: Colors.grey[400],
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
          alignLabelWithHint: true,
          suffixIcon: isPassword
              ? InkWell(
                  onTap: onTap,
                  child: Icon(
                    showPass ? Icons.visibility_off : Icons.remove_red_eye,
                    color: MainColors.blackColor,
                  ))
              : null,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MainColors.primaryColor)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MainColors.primaryColor)),
        ),
      ),
    );
  }
}

class DropDownInput extends StatelessWidget {
  final String? Function(dynamic)? validator;
  final String labelText;
  final List<DropdownMenuItem<dynamic>>? items;
  final Function(dynamic)? onChanged;
  const DropDownInput(
      {Key? key,
      this.validator,
      this.labelText = '',
      this.items,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
          validator: validator,
          isExpanded: true,
          decoration: InputDecoration(
              alignLabelWithHint: true,
              labelText: labelText,
              labelStyle: GoogleFonts.titilliumWeb(
                  color: Colors.grey.shade400,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: MainColors.primaryColor)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: MainColors.primaryColor))),
          items: items,
          onChanged: onChanged),
    );
  }
}
