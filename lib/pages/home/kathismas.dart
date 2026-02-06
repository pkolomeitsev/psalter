import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jungers_psalter/models/enums/entity_type.dart';
import 'package:jungers_psalter/storage/bookmark_storage.dart';
import 'package:jungers_psalter/ui/components/bookmark_card.dart';
import 'package:jungers_psalter/ui/views/list_view_wrapper.dart';

class Kathismas extends StatefulWidget {
  const Kathismas({super.key});

  static const int kathismasAmount = 20;
  //@TODO: refactor with JSON data
  static const List kathismasMap = [
    '1-8',
    '9-16',
    '17-23',
    '24-31',
    '32-36',
    '37-45',
    '46-54',
    '55-63',
    '64-69',
    '70-76',
    '77-84',
    '85-90',
    '91-100',
    '101-104',
    '105-108',
    '109-117',
    '118',
    '119-133',
    '134-142',
    '143-150'
  ];

  @override
  State<Kathismas> createState() => _KathismasState();
}

class _KathismasState extends State<Kathismas> {
  @override
  Widget build(BuildContext context) {
    List<Widget> psalms = [];
    List<int> bookmarks = BookmarkStorage.getBookmarks(EntityType.kathisma);

    for (int i = 1; i <= Kathismas.kathismasAmount; i++) {
      psalms.add(
        BookmarkCard(
          id: i,
          title: '${context.tr('kathisma')} $i',
          description: '${'psalms'.tr()} ${Kathismas.kathismasMap[i-1]}',
          type: EntityType.kathisma,
          isBookmarked: bookmarks.contains(i),
        ),
      );
    }

    return ListViewWrapper(data: psalms);
  }
}
