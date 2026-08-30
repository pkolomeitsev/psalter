import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:orth_psalter/theme/app_colors.dart';
import 'package:orth_psalter/ui/components/app_icon.dart';

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
            child: Column(
              spacing: 10,
              children: [
                Row(
                  spacing: 10,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                'assets/imgs/Saint_Gregory_the_Theologian.jpg',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: <Widget>[
                          Text(
                            context.tr('leftSideBarTitle'),
                            style: drawerHeaderTextStyle
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      context.tr('leftSideBarSubTitle'),
                      style: drawerHeaderTextStyle,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ],
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
