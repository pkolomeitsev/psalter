import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jungers_psalter/pages/bookmarks.dart';
import 'package:jungers_psalter/pages/home/home.dart';
import 'package:jungers_psalter/pages/settings.dart';

class MainApplication extends StatefulWidget {
  const MainApplication({super.key});

  @override
  State<MainApplication> createState() => _MainApplicationState();
}

class _MainApplicationState extends State<MainApplication> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.indigo,
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            selectedIcon: Icon(Icons.home, color: Colors.white),
            label: 'home'.tr(),
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark),
            selectedIcon: Icon(Icons.bookmark, color: Colors.white),
            label: 'bookmarks'.tr(),
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            selectedIcon: Icon(Icons.settings, color: Colors.white),
            label: 'settings'.tr(),
          ),
        ],
      ),
      body: <Widget>[
        DefaultTabController(length: 3, child: Home()),
        Bookmarks(),
        Settings(),
      ][currentPageIndex],
    );
  }
}
