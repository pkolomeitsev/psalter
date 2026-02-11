import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orth_psalter/pages/home/as_needed.dart';
import 'package:orth_psalter/pages/home/kathismas.dart';
import 'package:orth_psalter/pages/home/psalms.dart';

// import 'package:orth_psalter/l10n/app_localizations.dart';

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
        title: Text('appTitle'.tr(), style: TextStyle(color: Colors.white)),
        centerTitle: true,
        bottom: TabBar(
          tabs: [
            Tab(text: 'psalms'.tr()),
            Tab(text: 'kathismas'.tr()),
            Tab(text: 'asNeeded'.tr()),
          ],
          unselectedLabelColor: Colors.white70,
          labelStyle: TextStyle(
            color: Colors.white,
            // fontStyle: FontStyle.italic
          ),
          indicatorColor: Colors.white,
        ),
        backgroundColor: Colors.indigo,
      ),
      body: TabBarView(children: [Psalms(), Kathismas(), AsNeeded()]),
    );
  }
}
