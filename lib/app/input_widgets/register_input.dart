import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final void Function(String)? onChanged;
  final String? Function(String?, FocusNode?)? validator;
  final TextEditingController? controller;
  final bool? isPersonSelected;
  final bool? isPerson;
  const RegisterInput(
      {Key? key,
      required this.label,
      required this.placeholder,
      required this.onChanged,
      this.validator,
      this.controller,
      this.isPersonSelected = false,
      this.isPerson = false})
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
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
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
        ));
  }
}

class IdadeInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final void Function(String)? onChanged;
  final String? Function(String?, FocusNode?)? validator;
  final TextEditingController? controller;
  final bool? isPersonSelected;
  final bool? isPerson;
  const IdadeInput(
      {Key? key,
      required this.label,
      required this.placeholder,
      required this.onChanged,
      this.validator,
      this.controller,
      this.isPersonSelected = false,
      this.isPerson = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: isPerson!
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.bebasNeue(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    width: 150,
                    height: 45,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
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
                  )
                ],
              )
            : SizedBox());
  }
}

class SexInput extends StatelessWidget {
  final String label;
  final void Function(String?)? onChanged;
  // final String? Function(String?, FocusNode?)? validator;
  final TextEditingController? controller;
  final List<String>? items;
  final String? dropDownvalue;
  final bool? isSelected;
  final double? height;
  final double? width;
  final bool isPerson;
  const SexInput(
      {Key? key,
      required this.label,
      required this.onChanged,
      this.controller,
      this.items,
      required this.dropDownvalue,
      this.isSelected,
      this.height,
      this.width,
      this.isPerson = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: isPerson
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.bebasNeue(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      width: 150,
                      height: 45,
                      child: DropdownButton<String>(
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('Sexo',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                              )),
                        ),
                        icon: Icon(Icons.arrow_drop_down),
                        isExpanded: true,
                        value: dropDownvalue,
                        elevation: 16,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        onChanged: onChanged,
                        items: items!
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                ],
              )
            : SizedBox());
  }
}

class SelectInput extends StatelessWidget {
  final String label;
  final void Function(String?)? onChanged;
  // final String? Function(String?, FocusNode?)? validator;
  final TextEditingController? controller;
  final List<DropdownMenuItem<String>>? items;
  final String? dropDownvalue;
  final bool? isSelected;
  final double? height;
  final double? width;
  final bool isPerson;
  final Widget? placeholder;
  const SelectInput(
      {Key? key,
      required this.label,
      required this.onChanged,
      this.controller,
      this.items,
      required this.dropDownvalue,
      this.isSelected,
      this.height,
      this.width,
      this.isPerson = false,
      this.placeholder})
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
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                width: width,
                height: height ?? 45,
                child: DropdownButton<String>(
                  hint: placeholder,
                  icon: Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                  value: dropDownvalue,
                  elevation: 16,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: onChanged,
                  items: items,
                )),
          ],
        ));
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
              keyboardType: TextInputType.text,
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
