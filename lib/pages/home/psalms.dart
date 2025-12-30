import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jungers_psalter/models/enums/entity_type.dart';
import 'package:jungers_psalter/ui/components/list_view_card.dart';
import 'package:jungers_psalter/ui/views/list_view_wrapper.dart';

class Psalms extends StatefulWidget {
  const Psalms({super.key});

  @override
  State<Psalms> createState() => _PsalmsState();
}

class _PsalmsState extends State<Psalms> {
  int psalmsAmount = 151;

  @override
  Widget build(BuildContext context) {
    List<Widget> psalms = [];

    for (int i = 1; i <= psalmsAmount; i++) {
      psalms.add(
        BookmarkCard(
          id: i,
          title: '${'psalm'.tr()} $i',
          description: '',
          type: EntityType.psalm,
          isBookmarked: false,
        )
      );
    }
    
    return ListViewWrapper(data: psalms);
  }
}
