import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jungers_psalter/models/enums/bookmark_type.dart';

class ListViewCard extends StatefulWidget {
  final String title;
  final String description;
  final BookmarkType? bookmarkType;

  const ListViewCard({
    super.key,
    required this.title,
    this.description = '',
    this.bookmarkType = BookmarkType.none,
  });

  @override
  State<ListViewCard> createState() => _ListViewCardState();
}

class _ListViewCardState extends State<ListViewCard> {
  List<Widget> getLeftSideWidgets() {
    List<Widget> text = [];
    text.add(
      Text(
        widget.title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
    if (widget.description != '') {
      text.add(Text(widget.description));
    }

    return text;
  }

  IconData getBookmarkIcon() {
    return (BookmarkType.none == widget.bookmarkType)
        ? Icons.bookmark_outline
        : Icons.bookmark;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          print(widget.title);
          print(widget.description);
        },
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: this.getLeftSideWidgets(),
                ),
              ),
              IconButton(
                icon: Icon(this.getBookmarkIcon()),
                tooltip: 'addToBookmarks'.tr(),
                onPressed: () {
                  print('Bookmark ${widget.bookmarkType}');

                  setState(() {
                    ///
                  });

                  //@TODO add to the Store model
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'bookmarkeAddedMessage'.tr(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
