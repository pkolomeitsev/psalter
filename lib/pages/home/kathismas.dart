import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jungers_psalter/models/enums/entity_type.dart';
import 'package:jungers_psalter/ui/components/bookmark_card.dart';
import 'package:jungers_psalter/ui/views/list_view_wrapper.dart';

// import '../../l10n/app_localizations.dart';

class Kathismas extends StatefulWidget {
  const Kathismas({super.key});

  static const int kathismasAmount = 20;
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

class _KathismasState extends State<Kathismas> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    List<Widget> psalms = [];

    for (int i = 0; i < Kathismas.kathismasAmount; i++) {
      psalms.add(
        BookmarkCard(
          id: (i + 1),
          title: '${'kathisma'.tr()} ${i+1}',
          description: '${'psalms'.tr()} ${Kathismas.kathismasMap[i]}',
          type: EntityType.kathisma,
          isBookmarked: false,
        ),
      );
    }

    return ListViewWrapper(data: psalms);
  }
}
