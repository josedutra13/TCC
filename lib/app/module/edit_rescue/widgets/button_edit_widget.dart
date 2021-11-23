import 'package:flutter/material.dart';

class ButtonEdit extends StatelessWidget {
  final Widget icon;
  final void Function()? onPressed;
  final double? height;
  final double? width;
  final bool isBottomPopup;
  final EdgeInsets? padding;

  const ButtonEdit(
      {Key? key,
      required this.icon,
      required this.onPressed,
      this.height,
      this.width,
      this.isBottomPopup = false,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(top: 80.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: isBottomPopup ? Colors.white : Colors.black, width: 3),
            color: isBottomPopup ? Colors.transparent : Colors.white,
            borderRadius: isBottomPopup
                ? BorderRadius.all(Radius.circular(50))
                : BorderRadius.all(Radius.circular(100))),
        height: height ?? 50,
        width: width ?? 50,
        child: IconButton(onPressed: onPressed, icon: icon),
      ),
    );
  }
}
