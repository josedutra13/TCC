import '../../colors.dart';
import 'package:flutter/material.dart';

class TitleRegister extends StatelessWidget {
  final String title;
  const TitleRegister({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 15),
      child: Text(
        title,
        style: TextStyle(
            fontFamily: 'Geomanist',
            color: MainColors.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
