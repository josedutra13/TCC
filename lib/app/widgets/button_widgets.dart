import 'package:google_fonts/google_fonts.dart';

import '../../colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String? buttonText;
  final bool isBack;

  const ButtonWidget({
    Key? key,
    this.onPressed,
    this.buttonText,
    this.isBack = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.90,
        height: MediaQuery.of(context).size.height * 0.060,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: isBack
                  ? MaterialStateProperty.all<Color>(MainColors.whiteColor)
                  : MaterialStateProperty.all<Color>(MainColors.primaryColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: MainColors.primaryColor)))),
          child: Text(
            buttonText!,
            style: TextStyle(
                fontFamily: 'Geomanist',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color:
                    isBack ? MainColors.primaryColor : MainColors.whiteColor),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
