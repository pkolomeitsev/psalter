import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:orth_psalter/models/gesture/zoom_gesture.dart';
import 'package:orth_psalter/models/notifiers/page_notifier.dart';
import 'package:orth_psalter/models/psalter_before_after_prayers.dart';
import 'package:orth_psalter/storage/psalter_prayer_storage.dart';
import 'package:orth_psalter/theme/app_colors.dart';
import 'package:orth_psalter/ui/components/buttons/font_size_button.dart';
import 'package:orth_psalter/ui/views/prayer_view.dart';
import 'package:orth_psalter/ui/views/text_page_view_wrapper.dart';

class PsalterAfterPrayer extends StatefulWidget {
  const PsalterAfterPrayer({super.key});

  @override
  State<PsalterAfterPrayer> createState() => _PsalterAfterPrayerState();
}

class _PsalterAfterPrayerState extends State<PsalterAfterPrayer> {
  final PageNotifier pageNotifier = PageNotifier();

  Future<PsalterBeforeAfterPrayers> fetchData(BuildContext context) async {
    return await PsalterPrayerStorage.getBeforeAfterPrayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text(
          context.tr('prayersAfterPsalterReading'),
          style: TextStyle(color: Colors.white),
        ),
        actions: [FontSizeButton(notifier: pageNotifier)],
      ),
      body: FutureBuilder<PsalterBeforeAfterPrayers>(
        future: this.fetchData(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
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
                  return getPageContent(
                    snapshot.data as PsalterBeforeAfterPrayers,
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

  Widget getPageContent(PsalterBeforeAfterPrayers prayers) {
    TextStyle highlightSuggestionStyle = TextStyle(
      color: AppColors.textHeadingColor,
      fontStyle: FontStyle.italic,
    );

    return TextPageViewWrapper(data: [
      PrayerView(
        prayerText: prayers.getCommonPrayers().getHymnToTheTheotokos(),
      ),
      Text(
        style: highlightSuggestionStyle,
        prayers.getCommonPrayers().getHymnToTheTheotokosSuggestion(),
      ),
      PrayerView(
        prayerName: prayers.getCommonPrayers().getTrisagion2OurFatherLabel(),
        prayerText: prayers.getCommonPrayers().getTrisagion(),
      ),
      PrayerView(prayerText: prayers.getCommonPrayers().getGloryForever()),
      PrayerView(prayerText: prayers.getCommonPrayers().getMostHolyTrinity()),
      PrayerView(prayerText: prayers.getCommonPrayers().getLordHaveMercy3T()),
      PrayerView(prayerText: prayers.getCommonPrayers().getGloryForever()),
      PrayerView(prayerText: prayers.getCommonPrayers().getOurFather()),
      PrayerView(
        prayerName: prayers.getCommonPrayers().getTropariaLabel(),
        prayerText: prayers.getPsalmBeforeTroparion(),
      ),
      PrayerView(
        prayerText: prayers.getCommonPrayers().getLordHaveMercy40T(),
      ),
      PrayerView(
        prayerText: prayers.getCommonPrayers().getStEphremPrayer(),
      ),
      PrayerView(
        prayerName: prayers.getCommonPrayers().getPrayerLabel(),
        prayerText: prayers.getPsalmAfterPrayer(),
      ),
      PrayerView(
        prayerName: prayers.getCommonPrayers().getGloryForeverShort(),
        prayerText: prayers.getCommonPrayers().getGloryForever(),
      ),
      PrayerView(
        prayerText: prayers.getCommonPrayers().getLordHaveMercy3T(),
      ),
      PrayerView(
        prayerName: prayers.getPsalmAfterPrayerEndingLabel(),
        prayerText: prayers.getPsalmAfterPrayerEnding(),
      ),
      SizedBox(height: 20),
    ]);
  }
}
