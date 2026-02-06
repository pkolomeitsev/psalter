import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jungers_psalter/interfaces/entity_object_interface.dart';
import 'package:jungers_psalter/storage/bookmark_storage.dart';

class ChipList extends StatefulWidget {
  final List<EntityObjectInterface> chipList;
  const ChipList({super.key, required this.chipList});

  @override
  State<ChipList> createState() => _ChipListState();
}

class _ChipListState extends State<ChipList> {
  List<EntityObjectInterface> chipListState = [];

  @override
  void initState() {
    super.initState();
    chipListState = widget.chipList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> chips = [];

    for (var object in this.chipListState) {
      chips.add(
        InputChip(
          label: Text(object.getTitle()),
          onSelected: (bool selected) {
            context.go('/${object.getType()}/${object.getId()}');
          },
          onDeleted: () {
            setState(() {
              BookmarkStorage.deleteBookmark(object.getType(), object.getId());
              this.chipListState.remove(object);
            });
          },
        ),
      );
    }

    return Wrap(
        spacing: 5.0,
        children: chips,
    );
  }
}
