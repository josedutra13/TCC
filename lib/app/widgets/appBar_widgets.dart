import 'package:auresgate/app/widgets/button_widgets.dart';
import 'package:flutter/material.dart';

class AppPageBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? color;
  final double? elevation;
  final TextStyle? titleStyle;
  final VoidCallback? onMenu;
  final VoidCallback? onAction;
  final String? actionButtonLabel;
  final Widget? leading;
  final ButtonTypes? buttonType;

  const AppPageBarWidget({
    Key? key,
    required this.title,
    this.onMenu,
    this.onAction,
    this.actionButtonLabel,
    this.leading,
    this.buttonType,
    this.titleStyle,
    this.color,
    this.elevation,
  }) : super(key: key);

  void actionHandle() {
    if (onAction != null) {
      onAction!();
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return AppBar(
      elevation: elevation,
      backgroundColor: color ?? Colors.blue,
      iconTheme: const IconThemeData(color: Colors.white),
      automaticallyImplyLeading: true,
      leading: onMenu != null
          ? IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: onMenu)
          : null,
      title: Text(title, style: titleStyle ?? theme.textTheme.headline2),
      actions: <Widget>[
        if (onAction != null)
          IconButton(
            icon: Icon(
              Icons.help,
              color: Colors.white,
            ),
            onPressed: onAction,
          )
        // Button(
        //     padding:
        //         const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0),
        //     onPressed: actionHandle,
        //     title: actionButtonLabel!,
        //     type: buttonType == null ? ButtonTypes.PRIMARY : buttonType!),
      ],
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
