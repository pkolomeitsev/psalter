import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:orth_psalter/models/enums/entity_type.dart';
import 'package:orth_psalter/storage/bookmark_storage.dart';
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

  @override
  Widget build(BuildContext context) {
    List<Widget> psalms = [];
    List<int> bookmarks = BookmarkStorage.getBookmarks(EntityType.psalm);

    for (int i = 1; i <= psalmsAmount; i++) {
      psalms.add(
        BookmarkCard(
          id: i,
          title: '${'psalm'.tr()} $i',
          description: '',
          type: EntityType.psalm,
          isBookmarked: bookmarks.contains(i),
        )
      );
    }
    
    return ListViewWrapper(data: psalms);
  }
}
