import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orth_psalter/models/enums/entity_type.dart';
import 'package:orth_psalter/models/notifiers/last_viewed_notifier.dart';
import 'package:orth_psalter/storage/bookmark_storage.dart';
import 'package:orth_psalter/storage/last_viewed_storage.dart';
import 'package:orth_psalter/storage/psalm_storage.dart';
import 'package:orth_psalter/ui/components/bookmark_card.dart';

class AsNeeded extends StatefulWidget {
  final int psalmAmount = (PsalmStorage.psalmsAmount - 1);

  const AsNeeded({super.key});

  @override
  State<AsNeeded> createState() => _AsNeededState();
}

class _AsNeededState extends State<AsNeeded> {
  final LastViewedNotifier asNeededNotifier = LastViewedNotifier();
  int lastViewedId = 0;
  List<int> bookmarks = [];

  @override
  void initState() {
    super.initState();
    this.lastViewedId = LastViewedStorage().get(EntityType.asNeeded);
  }

  Future fetchBookmarks() async {
    return await BookmarkStorage.getBookmarks(EntityType.asNeeded);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: this.fetchBookmarks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          this.bookmarks = snapshot.data ?? [];

          return ListenableBuilder(
            listenable: asNeededNotifier,
            builder: (BuildContext context, Widget? child) {
              if (asNeededNotifier.getId() > 0) {
                this.lastViewedId = asNeededNotifier.getId();
              }

              return Semantics(
                identifier: 'as_needed_view',
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    DefaultTextStyle.merge(
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Text(
                        context.tr('psalterReadingAsNeeded'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 10),
                    DefaultTextStyle.merge(
                      style: const TextStyle(fontSize: 16),
                      child: Text(
                        context.tr(
                          'psalterReadingRuleByStArseniosTheCappadocian',
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ...this.renderPsalms(context),
                    SizedBox(height: 10),
                    const Image(
                      image: AssetImage(
                        'assets/imgs/Saint_Arsenios_the_Cappadocian_and_Father_Paisios.jpg',
                      ),
                    ),
                    SizedBox(height: 10),
                    DefaultTextStyle.merge(
                      style: const TextStyle(fontSize: 16),
                      child: Text(
                        context.tr('iconImageTitle'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }

        return const Center(child: Text('No data found'));
      },
    );
  }

  List<Widget> renderPsalms(BuildContext context) {
    List<Widget> psalms = [];
    for (var i = 1; i <= widget.psalmAmount; i++) {
      psalms.add(
        BookmarkCard(
          id: i,
          title: '${context.tr('psalm')} $i',
          description: context.tr('psalm${i}AsNeeded'),
          type: EntityType.asNeeded,
          isBookmarked: bookmarks.contains(i),
          isActive: (i == this.lastViewedId),
          notifier: this.asNeededNotifier,
        ),
      );

      if (i == 148) {
        psalms.add(SizedBox(height: 10));
        psalms.add(
          DefaultTextStyle.merge(
            style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            child: Text(context.tr('psalm149150AsNeededHelp')),
          ),
        );
        psalms.add(SizedBox(height: 10));
      }
    }

    return psalms;
  }
}
