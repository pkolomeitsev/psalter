import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:orth_psalter/theme/app_colors.dart';
import 'package:orth_psalter/ui/components/app_icon.dart';
import 'package:orth_psalter/ui/components/text/wisdom_widget.dart';

class LeftSideBar extends StatefulWidget {
  const LeftSideBar({super.key});

  @override
  State<LeftSideBar> createState() => _LeftSideBarState();
}

class _LeftSideBarState extends State<LeftSideBar> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  TextStyle drawerHeaderTextStyle = TextStyle(
    fontSize: 12,
    color: AppColors.brandColorLight,
  );

  @override
  Widget build(BuildContext context) {
    return Semantics(
      identifier: 'left_sidebar',
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsetsGeometry.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(color: AppColors.brandBgColor),
              child: this.getWisdomCarousel(context),
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
      ),
    );
  }

  Widget getWisdomCarousel(BuildContext context) {
    List<Widget> wisdomList = [
      WisdomWidget(
        wisdom: context.tr('leftSideBarWisdom1'),
        author: context.tr('leftSideBarWisdom1Author'),
        assetImage: 'assets/imgs/Saint_Gregory_the_Theologian.jpg',
        wisdomTextStyle: drawerHeaderTextStyle,
        authorTextStyle: drawerHeaderTextStyle,
      ),
      WisdomWidget(
        wisdom: context.tr('leftSideBarWisdom2'),
        author: context.tr('leftSideBarWisdom2Author'),
        assetImage: 'assets/imgs/Saint_John_Chrysostom.jpg',
        wisdomTextStyle: drawerHeaderTextStyle,
        authorTextStyle: drawerHeaderTextStyle,
      ),
    ];

    return Column(
      children: [
        Expanded(
          child: CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              enableInfiniteScroll: false,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            items: wisdomList,
          ),
        ),
        if (wisdomList.length > 1) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: wisdomList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (AppColors.brandColorLight)!.withValues(
                      alpha: _current == entry.key ? 0.9 : 0.4,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}
