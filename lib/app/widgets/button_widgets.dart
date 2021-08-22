import 'package:auresgate/app/ui/constants/colors_constants.dart';
import 'package:flutter/material.dart';


enum ButtonTypes {
  DEFAULT,
  PRIMARY,
}
enum ButtonShapes { SQUARE, ROUNDED }

// BUTTON

class Button extends StatelessWidget {
  final String title;
  final ButtonTypes type;
  final ButtonShapes btnShape;
  final EdgeInsets? padding;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;

  const Button(
      {required this.title,
      this.onPressed,
      this.onLongPress,
      this.icon,
      this.iconSize,
      this.padding,
      this.type = ButtonTypes.DEFAULT,
      this.btnShape = ButtonShapes.SQUARE,
      this.iconColor});

  // builda o estilo do botão
  ButtonStyle style(ThemeData theme) {
    Color textColor;
    Color? backgroundColor;
    BorderSide side = BorderSide.none;
    RoundedRectangleBorder? shape;
    double? elevation;

    switch (type) {
      case ButtonTypes.PRIMARY:
        backgroundColor = theme.primaryColor;
        break;
      case ButtonTypes.DEFAULT:
        backgroundColor = theme.accentColor;
        break;
    }

    if (btnShape == ButtonShapes.ROUNDED) {
      shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0));
    }

    return ElevatedButton.styleFrom(
        primary: backgroundColor,
        elevation: elevation,
        // onPrimary: textColor,
        // onSurface: NullUtils.isNull(onPressed) ? backgroundColor : null,
        side: side,
        shape: shape);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }}