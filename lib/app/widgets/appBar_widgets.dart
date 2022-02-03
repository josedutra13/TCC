import 'package:auresgate/app/widgets/button_widgets.dart';
import '../../colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppPageBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? color;
  final double? elevation;
  final TextStyle? titleStyle;
  final bool hasIcon;
  final Function()? onBack;
  final VoidCallback? onAction;
  final String? actionButtonLabel;
  final Widget? leading;
  final bool isMenu;

  const AppPageBarWidget({
    Key? key,
    required this.title,
    this.onAction,
    this.actionButtonLabel,
    this.leading,
    this.titleStyle,
    this.color,
    this.elevation,
    this.isMenu = false,
    this.onBack,
    this.hasIcon = true,
  }) : super(key: key);

  void actionHandle() {
    if (onAction != null) {
      onAction!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      iconTheme: isMenu
          ? IconThemeData(color: MainColors.primaryColor)
          : IconThemeData(color: MainColors.whiteColor),
      automaticallyImplyLeading: true,
      leading: isMenu
          ? null
          : hasIcon
              ? IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: MainColors.primaryColor,
                  ),
                  onPressed: onBack)
              : IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: MainColors.primaryColor,
                  ),
                  onPressed: onBack),
      title: Text(title,
          textAlign: TextAlign.justify,
          style: titleStyle ??
              TextStyle(
                  color: MainColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Geomanist',
                  fontSize: 25)),
      actions: <Widget>[
        if (onAction != null)
          IconButton(
            icon: Icon(
              isMenu ? Icons.replay : Icons.help,
              color: MainColors.primaryColor,
            ),
            onPressed: onAction,
          )
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

class AppPageStoryWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final Color? color;
  final double? elevation;
  final TextStyle? titleStyle;
  final VoidCallback? onBack;
  final VoidCallback? onAction;
  final String? actionButtonLabel;
  final Widget? leading;
  final bool isMenu;

  const AppPageStoryWidget({
    Key? key,
    required this.title,
    this.onBack,
    this.onAction,
    this.actionButtonLabel,
    this.leading,
    this.titleStyle,
    this.color,
    this.elevation,
    this.isMenu = false,
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
      backgroundColor: color ?? Colors.cyan[300],
      iconTheme: const IconThemeData(color: Colors.white),
      automaticallyImplyLeading: true,
      leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: onBack),
      title: Text(title, style: titleStyle ?? theme.textTheme.headline2),
      actions: <Widget>[
        if (onAction != null)
          IconButton(
            icon: Icon(
              isMenu ? Icons.replay : Icons.help,
              color: Colors.white,
            ),
            onPressed: onAction,
          )
      ],
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
