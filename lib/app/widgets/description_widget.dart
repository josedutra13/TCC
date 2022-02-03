import 'package:auresgate/colors.dart';
import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final Function(String)? onChanged;
  final bool isRescue;
  final String textRescue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const DescriptionWidget(
      {Key? key,
      this.onChanged,
      this.isRescue = false,
      this.textRescue = '',
      this.controller = null,
      this.validator = null})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 17.0),
          child: Container(
            width: 344.0,
            height: 168.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                width: 1.0,
                color: MainColors.primaryColor,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 17.0),
          child: Container(
            width: 136.0,
            height: 1.0,
            child: ClipRRect(
              borderRadius: BorderRadius.zero,
              child: Container(
                color: MainColors.whiteColor,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 15, right: 15),
          child: SizedBox(
            width: double.infinity,
            height: 155,
            child: isRescue
                ? Text(textRescue)
                : TextFormField(
                    controller: controller,
                    validator: validator,
                    expands: true,
                    minLines: null,
                    maxLines: null,
                    onChanged: onChanged,
                    decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                        labelStyle: TextStyle(color: Colors.transparent),
                        border: InputBorder.none),
                  ),
          ),
        ),
        Text('''Descrição''',
            overflow: TextOverflow.visible,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'Geomanist',
              color: MainColors.primaryColor,
              fontSize: 25,
              fontWeight: FontWeight.w400,
            )),
      ],
    );
  }
}
