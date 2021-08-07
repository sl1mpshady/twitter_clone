import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:twitter_clone/themes/theme.dart';

import 'dart:ui';

class ApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  ApplicationBar({Key key})
      : preferredSize = Size.fromHeight(50),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);

    return AppBar(
      brightness: themeNotifier.darkMode ? Brightness.dark : Brightness.light,
      elevation: 1,
      backgroundColor: Theme.of(context).backgroundColor,
      leading: GestureDetector(
        onTap: () => themeNotifier.setDarkMode(!themeNotifier.darkMode),
        child: Container(
            padding: const EdgeInsets.only(top: 4, bottom: 4, left: 20),
            child: Icon(
              Ionicons.menu_outline,
              color: Theme.of(context).primaryColor,
              size: 35,
            )),
      ),
      title: Icon(
        Ionicons.logo_twitter,
        color: Theme.of(context).primaryColor,
        size: 35,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(
            Ionicons.sparkles_outline,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
