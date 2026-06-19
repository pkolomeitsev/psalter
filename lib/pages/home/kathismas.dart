import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orth_psalter/mixins/scroll_position_storage_mixin.dart';
import 'package:orth_psalter/models/enums/entity_type.dart';
import 'package:orth_psalter/models/notifiers/last_viewed_kathismas_notifier.dart';
import 'package:orth_psalter/storage/bookmark_storage.dart';
import 'package:orth_psalter/storage/kathisma_storage.dart';
import 'package:orth_psalter/storage/last_viewed_storage.dart';
import 'package:orth_psalter/ui/components/bookmark_card.dart';
import 'package:orth_psalter/ui/views/list_view_wrapper.dart';

class Kathismas extends StatefulWidget {
  const Kathismas({super.key});

  @override
  State<Kathismas> createState() => _KathismasState();
}

class _KathismasState extends State<Kathismas> with ScrollPositionStorageMixin {
  int kathismasAmount = 0;
  int lastViewedId = 0;
  List<String> psalmsMap = [];
  List<int> bookmarks = [];
  final LastViewedKathismasNotifier kathismasNotifier =
      LastViewedKathismasNotifier();

  @override
  void initState() {
    super.initState();
    this.initScrollPositionStorageMixin(EntityType.kathisma, listView: true);
    this.kathismasAmount = KathismaStorage.kathismasAmount;
    this.psalmsMap = KathismaStorage.psalmsMap;
  }

  Future fetchActivityData() async {
    this.bookmarks = await BookmarkStorage.getBookmarks(EntityType.kathisma);
    this.lastViewedId = await LastViewedStorage().get(EntityType.kathisma);

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: this.fetchActivityData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return ListenableBuilder(
            listenable: kathismasNotifier,
            builder: (BuildContext context, Widget? child) {
              if (kathismasNotifier.getId() > 0) {
                this.lastViewedId = kathismasNotifier.getId();
              }

              return Semantics(
                identifier: 'kathismas_list',
                child: ListViewWrapper(
                  data: this.renderKathismas(context),
                  scrollController: this.getScrollController(),
                ),
              );
            },
          );
        }

        return const Center(child: Text('No data found'));
      },
    );
  }

  List<Widget> renderKathismas(BuildContext context) {
    List<Widget> kathismas = [];
    for (int i = 1; i <= this.kathismasAmount; i++) {
      kathismas.add(
        BookmarkCard(
          id: i,
          title: '${context.tr('kathisma')} $i',
          description: '${context.tr('psalms')} ${this.psalmsMap[i - 1]}',
          type: EntityType.kathisma,
          isBookmarked: bookmarks.contains(i),
          isActive: (i == this.lastViewedId),
          notifier: this.kathismasNotifier,
        ),
      );
    }

    return kathismas;
  }
}
