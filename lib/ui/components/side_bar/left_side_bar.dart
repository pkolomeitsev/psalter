import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:orth_psalter/theme/app_colors.dart';
import 'package:orth_psalter/ui/components/app_icon.dart';
import 'package:orth_psalter/ui/components/text/wisdom_widget.dart';

class LeftSideBar extends StatefulWidget {
  const LeftSideBar({super.key});

  @override
  State<LeftSideBar> createState() => _LeftSideBarState();
}

class _LeftSideBarState extends State<LeftSideBar> {
  @override
  Widget build(BuildContext context) {
    TextStyle drawerHeaderTextStyle = TextStyle(
      fontSize: 14,
      color: AppColors.brandColorLight,
    );

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsetsGeometry.all(10),
            decoration: BoxDecoration(color: AppColors.brandBgColor),
            child: WisdomWidget(
              wisdom: context.tr('leftSideBarWisdom'),
              author: context.tr('leftSideBarWisdomAuthor'),
              assetImage: 'assets/imgs/Saint_Gregory_the_Theologian.jpg',
              wisdomTextStyle: drawerHeaderTextStyle,
              authorTextStyle: drawerHeaderTextStyle,
            ),
          ),
          ListTile(
            leading: AppIcon(),
            title: Text(context.tr('prayersBeforePsalterReading')),
            onTap: () {
              Navigator.pop(context);
              context.go('/psalter/prayer/before');
            },
          ),
          ListTile(
            leading: AppIcon(),
            title: Text(context.tr('prayersAfterPsalterReading')),
            onTap: () {
              Navigator.pop(context);
              context.go('/psalter/prayer/after');
            },
          ),
        ],
      ),
    );
  }
}
