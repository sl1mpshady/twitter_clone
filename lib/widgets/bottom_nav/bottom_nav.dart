import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class BottomNav extends StatelessWidget {
  BottomNav({
    Key key,
    @required this.onTap,
    @required this.currentIndex,
    this.noSelected = false,
    this.navItems,
  }) : super(key: key);

  final Function onTap;
  final int currentIndex;
  final List<BottomNavigationBarItem> navItems;
  final bool noSelected;

  final List<IconData> items = [
    Ionicons.home_outline,
    Ionicons.search_outline,
    Ionicons.notifications_outline,
    Ionicons.mail_outline
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            offset: Offset(0, -1.0),
            blurRadius: 1,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: BottomNavigationBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
          onTap: onTap,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          fixedColor: noSelected
              ? Theme.of(context).bottomNavigationBarTheme.unselectedItemColor
              : null,
          selectedLabelStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500, color: Colors.yellow),
          unselectedLabelStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
          ),
          type: BottomNavigationBarType.fixed,
          currentIndex: this.currentIndex ?? 0,
          items: navItems ??
              items
                  .asMap()
                  .map((index, item) {
                    return MapEntry(
                      index,
                      BottomNavigationBarItem(
                          activeIcon: !noSelected
                              ? Container(
                                  padding:
                                      const EdgeInsets.only(top: 10, bottom: 5),
                                  child: Icon(item,
                                      color: Theme.of(context)
                                          .bottomNavigationBarTheme
                                          .selectedItemColor),
                                )
                              : null,
                          icon: Container(
                            padding: const EdgeInsets.only(top: 10, bottom: 5),
                            child: Icon(
                              item,
                              color: Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .unselectedItemColor,
                            ),
                          ),
                          label: ''),
                    );
                  })
                  .values
                  .toList()),
    );
  }
}
