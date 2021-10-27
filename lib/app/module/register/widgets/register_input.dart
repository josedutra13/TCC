import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final void Function(String)? onChanged;
  final String? Function(String?, FocusNode?)? validator;
  final TextEditingController? controller;
  const RegisterInput(
      {Key? key,
      required this.label,
      required this.placeholder,
      required this.onChanged,
      this.validator,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.bebasNeue(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            height: 45,
            child: TextFormField(
              onChanged: onChanged,
              controller: controller,
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: TextStyle(fontWeight: FontWeight.w300),
                fillColor: Colors.white70,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final void Function(String)? onChanged;
  final String? Function(String?, FocusNode?)? validator;
  final void Function()? onShowPassword;
  final bool obscureText;
  final bool obscureTextOption;
  final AutovalidateMode? autovalidateMode;
  final TextEditingController? controller;

  const PasswordInput(
      {Key? key,
      required this.label,
      required this.placeholder,
      this.onChanged,
      this.validator,
      this.onShowPassword,
      this.obscureText = true,
      this.obscureTextOption = true,
      this.autovalidateMode,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.bebasNeue(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            height: 45,
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              autovalidateMode: autovalidateMode,
              obscureText: obscureText,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: TextStyle(fontWeight: FontWeight.w300),
                suffixIcon: obscureTextOption
                    ? IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.remove_red_eye,
                          size: 20,
                          color: obscureText ? Colors.grey : Colors.red,
                        ),
                        onPressed: onShowPassword,
                      )
                    : null,
                fillColor: Colors.white70,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
