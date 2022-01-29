import 'package:auresgate/app/widgets/button_widgets.dart';
import '../../colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppPageBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? color;
  final double? elevation;
  final TextStyle? titleStyle;
  final VoidCallback? onMenu;
  final Function()? onBack;
  final VoidCallback? onAction;
  final String? actionButtonLabel;
  final Widget? leading;
  final bool isMenu;

  const AppPageBarWidget({
    Key? key,
    required this.title,
    this.onMenu,
    this.onAction,
    this.actionButtonLabel,
    this.leading,
    this.titleStyle,
    this.color,
    this.elevation,
    this.isMenu = false,
    this.onBack,
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
      backgroundColor: MainColors.whiteColor,
      iconTheme: const IconThemeData(color: Colors.white),
      automaticallyImplyLeading: true,
      leading: onMenu != null
          ? IconButton(
              icon: Icon(
                Icons.menu,
                color: MainColors.primaryColor,
              ),
              onPressed: onMenu)
          : IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: MainColors.primaryColor,
              ),
              onPressed: onBack),
      title: Text(title,
          textAlign: TextAlign.justify,
          style: titleStyle ??
              GoogleFonts.titilliumWeb(
                  fontSize: 25,
                  color: MainColors.primaryColor,
                  fontWeight: FontWeight.w600)),
      actions: <Widget>[
        if (onAction != null)
          IconButton(
            icon: Icon(
              isMenu ? Icons.replay : Icons.help,
              color: MainColors.whiteColor,
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
