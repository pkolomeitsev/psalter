import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:orth_psalter/mixins/scroll_position_storage_mixin.dart';
import 'package:orth_psalter/models/enums/entity_type.dart';
import 'package:orth_psalter/models/gesture/zoom_gesture.dart';
import 'package:orth_psalter/models/kathisma.dart' as kathisma_model;
import 'package:orth_psalter/models/notifiers/page_notifier.dart';
import 'package:orth_psalter/models/psalm.dart';
import 'package:orth_psalter/models/router_extra_parameters.dart';
import 'package:orth_psalter/singleton/appearance_config_singleton.dart';
import 'package:orth_psalter/storage/kathisma_storage.dart';
import 'package:orth_psalter/storage/system/scroll_position_storage.dart';
import 'package:orth_psalter/ui/components/buttons/font_size_button.dart';
import 'package:orth_psalter/ui/components/text/prayers/glory_forever_short_widget.dart';
import 'package:orth_psalter/ui/components/glory_forever_widget.dart';
import 'package:orth_psalter/ui/components/text/prayers/trisagion_2_our_father_widget.dart';
import 'package:orth_psalter/ui/components/text/prayers/kathisma/troparion_widget.dart';
import 'package:orth_psalter/ui/views/prayer_view.dart';
import 'package:orth_psalter/ui/views/psalm_view.dart';
import 'package:orth_psalter/ui/views/text_page_view_wrapper.dart';

class Kathisma extends StatefulWidget {
  final int kathismaId;
  const Kathisma({super.key, required this.kathismaId});

  @override
  State<Kathisma> createState() => _KathismaState();
}

class _KathismaState extends State<Kathisma> with ScrollPositionStorageMixin {
  late RouterExtraParameters routerExtra;
  final PageNotifier pageNotifier = PageNotifier();

  Future<kathisma_model.Kathisma> fetchData(BuildContext context) async {
    this.routerExtra = (GoRouterState.of(context).extra != null)
        ? GoRouterState.of(context).extra as RouterExtraParameters
        : RouterExtraParameters();
    if (this.routerExtra.isResetScrollPosition()) {
      await ScrollPositionStorage.deleteOffset(EntityType.kathisma);
    }

    return await KathismaStorage.getKathismaById(widget.kathismaId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text(
          '${context.tr('kathisma')} ${widget.kathismaId}',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          FontSizeButton(notifier: pageNotifier)
        ],
      ),
      body: FutureBuilder<kathisma_model.Kathisma>(
        future: this.fetchData(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error} ${snapshot.stackTrace}'),
            );
          } else if (snapshot.hasData) {
            // initialize scroll position after async data loaded
            this.initScrollPositionStorageMixin(EntityType.kathisma);

            return GestureDetector(
              onScaleUpdate: (ScaleUpdateDetails scaleUpdateDetails) {
                if (ZoomGesture().isZoomOut(scaleUpdateDetails.scale) ||
                    ZoomGesture().isZoomIn(scaleUpdateDetails.scale)) {
                  setState(() {
                    ZoomGesture().onScaleUpdate(scaleUpdateDetails);
                  });
                }
              },
              child: ListenableBuilder(
                listenable: pageNotifier,
                builder: (BuildContext context, Widget? child) {
                  return TextPageViewWrapper(
                    data: [
                      this.renderPsalms(context, snapshot.data),
                      this.renderTrisagion2OurFather(snapshot.data),
                      this.renderTroparion(snapshot.data),
                      DefaultTextStyle.merge(
                        style: TextStyle(
                          fontSize: AppearanceConfigSingleton()
                              .getBodyFontSize(),
                        ),
                        child: SelectableText(
                          snapshot.data!
                              .getCommonPrayers()
                              .getLordHaveMercy40T(),
                        ),
                      ),
                      SizedBox(height: 10),
                      this.renderPrayer(snapshot.data),
                      SizedBox(height: 10),
                    ],
                    scrollController: this.routerExtra.isEnableScrollStorage()
                      ? this.getScrollController()
                      : null,
                  );
                },
              ),
            );
          }

          return const Center(child: Text('No data found'));
        },
      ),
    );
  }

  Widget renderPsalms(BuildContext context, kathisma_model.Kathisma? kathisma) {
    List<Widget> psalmWidgets = [];
    List<Psalm> psalms = kathisma!.getPsalms() ?? [];
    List<int> gloryAfter = kathisma.getGloryAfter() ?? [];

    for (final psalm in psalms) {
      psalm.setTitle(
        "${kathisma.getCommonPrayers().getPsalmLabel()} ${psalm.getNumber()}",
      );
      psalmWidgets.add(PsalmView(psalm: psalm));
      // add 1, 2 glory
      if (gloryAfter.contains(psalm.getNumber())) {
        psalmWidgets.add(
          GloryForeverWidget(trisagion2ourFather: kathisma.getCommonPrayers()),
        );
      }
      // short glory forever after 150 psalm
      if (psalm.getNumber() == 150) {
        psalmWidgets.add(
          GloryForeverShortWidget(
            commonPrayers: kathisma.getCommonPrayers(),
          ),
        );
      }
    }
    // add 3rd glory
    psalmWidgets.add(
      GloryForeverShortWidget(
        commonPrayers: kathisma.getCommonPrayers(),
      ),
    );

    return Column(children: psalmWidgets);
  }

  Widget renderTrisagion2OurFather(kathisma_model.Kathisma? kathisma) {
    return Column(
      children: [
        Trisagion2OurFatherWidget(
          commonPrayers: kathisma!.getCommonPrayers(),
        ),
      ],
    );
  }

  Widget renderTroparion(kathisma_model.Kathisma? kathisma) {
    return Column(children: [TroparionWidget(kathisma: kathisma)]);
  }

  Widget renderPrayer(kathisma_model.Kathisma? kathisma) {
    return Column(
      children: [
        PrayerView(
          prayerName: kathisma!.getCommonPrayers().getPrayerLabel(),
          prayerText: kathisma.getPrayer(),
        ),
      ],
    );
  }
}
