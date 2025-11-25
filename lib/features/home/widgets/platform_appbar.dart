import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class PlatformAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? backButton;
  final List<Widget>? rightButtons;
  const PlatformAppBar({
    super.key,
    this.title,
    this.backButton,
    this.rightButtons,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoNavigationBar(
        middle: title != null
            ? Text(title!, style: Theme.of(context).textTheme.headlineMedium)
            : null,
        leading: backButton,
        trailing: rightButtons != null
            ? Row(mainAxisSize: MainAxisSize.min, children: rightButtons!)
            : null,
        backgroundColor: Colors.yellow,
      );
    }
    return AppBar(
      title: title != null
          ? Text(title!, style: Theme.of(context).textTheme.headlineMedium)
          : null,
      leading: backButton,
      actions: rightButtons,
      backgroundColor: Colors.yellow,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
