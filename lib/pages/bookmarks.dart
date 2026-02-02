import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jungers_psalter/models/enums/entity_type.dart';
import 'package:jungers_psalter/storage/bookmark_storage.dart';
import 'package:jungers_psalter/ui/components/settings_card.dart';
import 'package:jungers_psalter/ui/components/settings_card_title.dart';
import 'package:jungers_psalter/ui/views/text_page_view_wrapper.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({super.key});

  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
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
          this.renderBookmarks(context, EntityType.psalm),
          this.renderBookmarks(context, EntityType.kathisma),
        ],
      ),
    );
  }

  Widget renderBookmarks(BuildContext context, EntityType type) {
    List<int> ids = BookmarkStorage.getBookmarks(type);
    String cardTitle = (type == EntityType.psalm) ? 'psalms' : 'kathismas';

    return Column(
      children: [
        Row(
          children: [
            Expanded(child: SettingsCardTitle(text: context.tr(cardTitle))),
          ],
        ),
        SettingsCard(children: [this.renderBookmarksChips(context, type, ids)]),
      ],
    );
  }

  Widget renderBookmarksChips(
    BuildContext context,
    EntityType type,
    List<int> ids,
  ) {
    List<Widget> chips = [];

    for (var id in ids) {
      chips.add(
        InputChip(
          label: Text('${context.tr(type.name)} $id'),
          onSelected: (bool selected) {
            context.go('/${type.name}/$id');
          },
          onDeleted: () {
            ids.remove(id);
          },
        ),
      );
    }

    return Wrap(
        // alignment: WrapAlignment.center,
        spacing: 5.0,
        children: chips
    );
  }
}
