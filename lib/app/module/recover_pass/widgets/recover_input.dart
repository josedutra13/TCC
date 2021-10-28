import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecoverInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final void Function(String)? onChanged;
  final String? Function(String?, FocusNode?)? validator;
  final TextEditingController? controller;
  const RecoverInput(
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
      padding: const EdgeInsets.only(top: 50, left: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.bebasNeue(
                color: Colors.cyan[300],
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            width: 260,
            height: 45,
            child: TextFormField(
              onChanged: onChanged,
              controller: controller,
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: TextStyle(fontWeight: FontWeight.w300),
                fillColor: Colors.white70,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
