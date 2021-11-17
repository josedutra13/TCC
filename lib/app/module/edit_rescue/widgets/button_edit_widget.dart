import 'package:flutter/material.dart';

class ButtonEdit extends StatelessWidget {
  final Widget icon;
  final void Function()? onPressed;
  final double? height;
  final double? width;
  final bool isBottomPopup;

  const ButtonEdit(
      {Key? key,
      required this.icon,
      required this.onPressed,
      this.height,
      this.width,
      this.isBottomPopup = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
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
