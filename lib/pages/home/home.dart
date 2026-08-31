import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orth_psalter/pages/home/as_needed.dart';
import 'package:orth_psalter/pages/home/kathismas.dart';
import 'package:orth_psalter/pages/home/psalms.dart';
import 'package:orth_psalter/ui/components/app_title.dart';
import 'package:orth_psalter/ui/components/side_bar/left_side_bar.dart';

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
        centerTitle: true,
        title: AppTitle(),
        bottom: TabBar(
          tabs: [
            Semantics(
              identifier: 'psalms',
              child: Tab(text: context.tr('psalms')),
            ),
            Semantics(
              identifier: 'kathismas',
              child: Tab(text: context.tr('kathismas')),
            ),
            Semantics(
              identifier: 'as_needed',
              child: Tab(text: context.tr('asNeeded')),
            ),
          ],
        ),
      ),
      body: TabBarView(children: [Psalms(), Kathismas(), AsNeeded()]),
      drawer: LeftSideBar(),
    );
  }
}
