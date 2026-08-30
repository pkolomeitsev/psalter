import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orth_psalter/models/interfaces/entity_object_interface.dart';
import 'package:orth_psalter/models/bookmark.dart';
import 'package:orth_psalter/models/enums/entity_type.dart';
import 'package:orth_psalter/models/notifiers/last_viewed_bookmarks_notifier.dart';
import 'package:orth_psalter/storage/bookmark_storage.dart';
import 'package:orth_psalter/storage/system/last_viewed_bookmarks_storage.dart';
import 'package:orth_psalter/ui/components/app_title.dart';
import 'package:orth_psalter/ui/components/bookmark_card.dart';
import 'package:orth_psalter/ui/components/chip_list.dart';
import 'package:orth_psalter/ui/components/settings_card.dart';
import 'package:orth_psalter/ui/components/settings_card_title.dart';
import 'package:orth_psalter/ui/components/side_bar/left_side_bar.dart';
import 'package:orth_psalter/ui/views/text_page_view_wrapper.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({super.key});

  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  List<int> psalmIds = [], kathismaIds = [], asNeededIds = [];
  Map<EntityType, int> lastViewed = {};
  LastViewedBookmarksNotifier bookmarksNotifier = LastViewedBookmarksNotifier();

  Future fetchActivityData() async {
    this.psalmIds = await BookmarkStorage.getBookmarks(EntityType.psalm);
    this.kathismaIds = await BookmarkStorage.getBookmarks(EntityType.kathisma);
    this.asNeededIds = await BookmarkStorage.getBookmarks(EntityType.asNeeded);

    this.lastViewed = {
      EntityType.psalm: await LastViewedBookmarksStorage().get(EntityType.psalm),
      EntityType.kathisma: await LastViewedBookmarksStorage().get(EntityType.kathisma),
      EntityType.asNeeded: await LastViewedBookmarksStorage().get(EntityType.asNeeded),
    };

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppTitle()),
      drawer: LeftSideBar(),
      body: FutureBuilder(
        future: this.fetchActivityData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListenableBuilder(
              listenable: bookmarksNotifier,
              builder: (BuildContext context, Widget? child) {
                for (var type in EntityType.values) {
                  if (bookmarksNotifier.getIdByType(type) > 0) {
                    lastViewed[type] = bookmarksNotifier.getIdByType(type);
                  }
                }

                return Semantics(
                  identifier: 'bookmarks_view',
                  child: TextPageViewWrapper(
                    data: [
                      if (psalmIds.isEmpty &&
                          kathismaIds.isEmpty &&
                          asNeededIds.isEmpty) ...[
                        Text(context.tr('noBookmarks')),
                      ] else ...[
                        this.renderBookmarks(context, EntityType.psalm, psalmIds),
                        this.renderBookmarks(
                          context,
                          EntityType.kathisma,
                          kathismaIds,
                        ),
                        this.renderBookmarks(
                          context,
                          EntityType.asNeeded,
                          asNeededIds,
                        ),
                      ],
                    ],
                  ),
                );
              },
            );
          }

          return const Center(child: Text('No data found'));
        },
      ),
    );
  }

  Widget renderBookmarks(BuildContext context, EntityType type, List<int> ids) {
    String cardTitle = (type == EntityType.asNeeded)
        ? type.name
        : '${type.name}s';

    if (ids.isEmpty) {
      return SizedBox();
    }

    return Column(
      children: [
        Row(
          children: [
            Expanded(child: SettingsCardTitle(text: context.tr(cardTitle))),
          ],
        ),
        if (type == EntityType.asNeeded) ...[
          this.renderBookmarksCards(context, type, ids),
        ] else ...[
          SettingsCard(
            children: [this.renderBookmarksChips(context, type, ids)],
          ),
        ],
      ],
    );
  }

  Widget renderBookmarksChips(
    BuildContext context,
    EntityType type,
    List<int> ids,
  ) {
    List<EntityObjectInterface> chips = [];

    for (var id in ids) {
      chips.add(
        Bookmark(id: id, title: '${context.tr(type.name)} $id', type: type),
      );
    }

    return ChipList(
      chipList: chips,
      selectedId: this.lastViewed[type] ?? 0,
      notifier: this.bookmarksNotifier,
    );
  }

  Widget renderBookmarksCards(
    BuildContext context,
    EntityType type,
    List<int> ids,
  ) {
    List<Widget> cards = [];

    for (var id in ids) {
      String description = context.tr('psalm${id}AsNeeded');

      cards.add(
        BookmarkCard(
          id: id,
          title: '${context.tr('psalm')} $id',
          description: description,
          type: EntityType.asNeeded,
          isBookmarked: true,
          isActive: (id == (this.lastViewed[type] ?? 0)),
          notifier: this.bookmarksNotifier,
        ),
      );
    }

    return Column(children: cards);
  }
}
