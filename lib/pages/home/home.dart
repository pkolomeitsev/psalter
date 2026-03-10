import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orth_psalter/pages/home/as_needed.dart';
import 'package:orth_psalter/pages/home/kathismas.dart';
import 'package:orth_psalter/pages/home/psalms.dart';
import 'package:orth_psalter/ui/components/app_title.dart';

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
        title: AppTitle(),
        bottom: TabBar(
          tabs: [
            Tab(text: context.tr('psalms')),
            Tab(text: context.tr('kathismas')),
            Tab(text: context.tr('asNeeded')),
          ],
          unselectedLabelColor: Colors.white70,
          labelStyle: TextStyle(color: Colors.white),
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(children: [Psalms(), Kathismas(), AsNeeded()]),
    );
  }
}
