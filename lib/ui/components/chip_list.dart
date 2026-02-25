import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orth_psalter/models/interfaces/entity_object_interface.dart';
import 'package:orth_psalter/storage/bookmark_storage.dart';

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
            context.go('/${object.getType().name}/${object.getId()}');
          },
          onDeleted: () async {
            final bool? didConfirm = await deleteConfirmDialog(
              context,
              object.getTitle(),
            );

            if (didConfirm == true) {
              setState(() {
                BookmarkStorage.deleteBookmark(
                  object.getType(),
                  object.getId(),
                );
                this.chipListState.remove(object);
              });
            }
          },
        ),
      );
    }

    return Wrap(spacing: 5.0, children: chips);
  }

  Future<bool?> deleteConfirmDialog(
    BuildContext context,
    String chipName,
  ) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            context.tr(
              'deleteBookmarkConfirm',
              namedArgs: {'chipName': chipName},
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(context.tr('cancel')),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text(context.tr('delete')),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}
