import 'package:flutter/material.dart';
import 'package:jungers_psalter/pages/home/as_needed.dart';
import 'package:jungers_psalter/pages/home/kathismas.dart';
import 'package:jungers_psalter/pages/home/psalms.dart';

import 'package:jungers_psalter/l10n/app_localizations.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
        bottom: TabBar(
          tabs: [
            Tab(text: AppLocalizations.of(context)!.psalms),
            Tab(text: AppLocalizations.of(context)!.kathismas),
            Tab(text: AppLocalizations.of(context)!.asNeeded),
          ],
          unselectedLabelColor: Colors.red,
          labelStyle: TextStyle(
              color: Colors.red,
              fontStyle: FontStyle.italic
          ),
        ),
      ),
      body: TabBarView(children: [
        Psalms(),
        Kathismas(),
        AsNeeded(),
      ]),
    );
  }
}
