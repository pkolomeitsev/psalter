import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orth_psalter/interfaces/entity_object_interface.dart';
import 'package:orth_psalter/models/bookmark.dart';
import 'package:orth_psalter/models/enums/entity_type.dart';
import 'package:orth_psalter/storage/bookmark_storage.dart';
import 'package:orth_psalter/ui/components/bookmark_card.dart';
import 'package:orth_psalter/ui/components/chip_list.dart';
import 'package:orth_psalter/ui/components/settings_card.dart';
import 'package:orth_psalter/ui/components/settings_card_title.dart';
import 'package:orth_psalter/ui/views/text_page_view_wrapper.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({super.key});

  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  List<int> psalmIds = BookmarkStorage.getBookmarks(EntityType.psalm);
  List<int> kathismaIds = BookmarkStorage.getBookmarks(EntityType.kathisma);
  List<int> asNeededIds = BookmarkStorage.getBookmarks(EntityType.asNeeded);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr('appTitle'),
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: TextPageViewWrapper(
        data: [
          if (psalmIds.isEmpty && kathismaIds.isEmpty && asNeededIds.isEmpty) ...[
            Text(context.tr('noBookmarks'))
          ]
          else ...[
            this.renderBookmarks(context, EntityType.psalm, psalmIds),
            this.renderBookmarks(context, EntityType.kathisma, kathismaIds),
            this.renderBookmarks(context, EntityType.asNeeded, asNeededIds),
          ]
        ],
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
        ]
        else ...[
          SettingsCard(children: [this.renderBookmarksChips(context, type, ids)]),
        ]
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
        Bookmark(id: id, title: '${context.tr(type.name)} $id', type: type)
      );
    }

    return ChipList(chipList: chips);
  }

  Widget renderBookmarksCards(
    BuildContext context,
    EntityType type,
    List<int> ids
  ) {
    List<Widget> cards = [];
    List<int> bookmarks = BookmarkStorage.getBookmarks(EntityType.asNeeded);

    for (var id in ids) {
      String description = context.tr('psalm${id}AsNeeded');

      cards.add(
          BookmarkCard(
            id: id,
            title: '${context.tr('psalm')} $id',
            description: description,
            type: EntityType.asNeeded,
            isBookmarked: bookmarks.contains(id),
          )
      );
    }

    return Column(
      children: cards,
    );
  }
}
