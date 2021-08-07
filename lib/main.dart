import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/screens/home.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:twitter_clone/widgets/bottom_nav/bottom_nav.dart';
import 'package:twitter_clone/themes/theme.dart';
import 'package:flutter/services.dart';
import 'package:twitter_clone/themes/light_theme.dart';
import 'package:twitter_clone/themes/dark_theme.dart';

void main() {
  final _themeNotifier = ThemeNotifier();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => _themeNotifier,
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
        theme: lightTheme(),
        darkTheme: darkTheme(),
        themeMode: themeNotifier.darkMode ? ThemeMode.dark : ThemeMode.light,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child,
          );
        },
        home: MainContainer());
  }
}

class MainContainer extends StatefulWidget {
  MainContainer({Key key}) : super(key: key);

  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  PersistentTabController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  void onBottomNavTap(int index, {NavBarEssentials navBarEssentials}) {
    setState(() {
      _currentIndex = index;
      _controller.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      backgroundColor: Colors.red,
      body: PersistentTabView.custom(
        context,
        items: [1, 2, 3, 4]
            .map((e) => PersistentBottomNavBarItem(icon: Icon(Icons.add)))
            .toList(),
        backgroundColor: Theme.of(context).backgroundColor,
        bottomScreenMargin: 0,
        margin: EdgeInsets.all(0),
        controller: _controller,
        screens: [
          Home(),
          Home(),
          Home(),
          Home(),
        ],
        confineInSafeArea: true,
        itemCount: 4,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: false,
        stateManagement: true,
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        customWidget: (NavBarEssentials navBarEssentials) => BottomNav(
          currentIndex: _currentIndex,
          onTap: (index) =>
              onBottomNavTap(index, navBarEssentials: navBarEssentials),
        ),
      ),
    );
  }
}
