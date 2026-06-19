import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:orth_psalter/helpers/debouncer_helper.dart';
import 'package:orth_psalter/models/enums/entity_type.dart';
import 'package:orth_psalter/models/notifiers/last_viewed_psalms_notifier.dart';
import 'package:orth_psalter/storage/bookmark_storage.dart';
import 'package:orth_psalter/storage/last_viewed_storage.dart';
import 'package:orth_psalter/storage/psalm_storage.dart';
import 'package:orth_psalter/storage/scroll_position_storage.dart';
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
  late ScrollController scrollController;
  final debouncer = DebouncerHelper(milliseconds: 1000);
  final LastViewedPsalmsNotifier lastViewedNotifier =
      LastViewedPsalmsNotifier();

  @override
  void initState() {
    super.initState();
    this.scrollController = ScrollController();
    this.scrollController.addListener(this.saveScrollPosition);
  }

  void saveScrollPosition() async {
    print('call saveScrollPosition()');
    // Only saves if the position has changed significantly to optimize disk writes
    debouncer.run(() async {
      await ScrollPositionStorage.setOffset(
        EntityType.psalm,
        this.scrollController.position.pixels,
        listView: true,
      );
    });
  }

  Future fetchActivityData() async {
    this.bookmarks = await BookmarkStorage.getBookmarks(EntityType.psalm);
    this.lastViewedId = await LastViewedStorage().get(EntityType.psalm);

    final scrollValue = await ScrollPositionStorage.getOffset(
      EntityType.psalm,
      listView: true,
    );
    final double? offset = double.tryParse(scrollValue.toString());
    if (offset != null && offset > 0) {
      // Wait for layout rendering to complete before scrolling
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (this.scrollController.hasClients) {
          this.scrollController.jumpTo(offset);
        }
      });
    }

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
            listenable: lastViewedNotifier,
            builder: (BuildContext context, Widget? child) {
              if (lastViewedNotifier.getId() > 0) {
                this.lastViewedId = lastViewedNotifier.getId();
              }

              return ListViewWrapper(
                data: this.renderPsalms(context),
                scrollController: this.scrollController,
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
    for (int i = 1; i <= this.psalmsAmount; i++) {
      psalms.add(
        BookmarkCard(
          id: i,
          title: '${context.tr('psalm')} $i',
          type: EntityType.psalm,
          isBookmarked: this.bookmarks.contains(i),
          isActive: (i == this.lastViewedId),
          notifier: this.lastViewedNotifier,
        ),
      );
    }

    return psalms;
  }
}
