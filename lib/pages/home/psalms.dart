import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:orth_psalter/models/enums/entity_type.dart';
import 'package:orth_psalter/models/notifiers/last_viewed_psalms_notifier.dart';
import 'package:orth_psalter/storage/bookmark_storage.dart';
import 'package:orth_psalter/storage/last_viewed_storage.dart';
import 'package:orth_psalter/storage/psalm_storage.dart';
import 'package:orth_psalter/ui/components/bookmark_card.dart';
import 'package:orth_psalter/ui/views/list_view_wrapper.dart';

class Psalms extends StatefulWidget {
  const Psalms({super.key});

  @override
  State<Psalms> createState() => _PsalmsState();
}

class _PsalmsState extends State<Psalms> {
  int psalmsAmount = PsalmStorage.psalmsAmount;
  int lastViewedId = 0;
  List<int> bookmarks = [];
  final LastViewedPsalmsNotifier psalmsNotifier = LastViewedPsalmsNotifier();

  @override
  void initState() {
    super.initState();
    this.lastViewedId = LastViewedStorage().get(EntityType.psalm);
    this.bookmarks = BookmarkStorage.getBookmarks(EntityType.psalm);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: psalmsNotifier,
      builder: (BuildContext context, Widget? child) {
        if (psalmsNotifier.getId() > 0) {
          this.lastViewedId = psalmsNotifier.getId();
        }

        return ListViewWrapper(data: this.renderPsalms(context));
      },
    );
  }

  List<Widget> renderPsalms(BuildContext context) {
    List<Widget> psalms = [];
    for (int i = 1; i <= this.psalmsAmount; i++) {
      psalms.add(
          BookmarkCard(
            id: i,
            title: '${context.tr('psalm')} $i',
            type: EntityType.psalm,
            isBookmarked: this.bookmarks.contains(i),
            isActive: (i == this.lastViewedId),
            notifier: this.psalmsNotifier,
          )
      );
    }

    return psalms;
  }
}
