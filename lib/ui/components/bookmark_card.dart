import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jungers_psalter/models/enums/entity_type.dart';

class BookmarkCard extends StatefulWidget {
  final int id;
  final String title;
  final String description;
  final EntityType? type;
  final bool isBookmarked;

  const BookmarkCard({
    super.key,
    required this.id,
    required this.title,
    this.description = '',
    this.type = EntityType.none,
    this.isBookmarked = false,
  });

  @override
  State<BookmarkCard> createState() => _BookmarkCardState();
}

class _BookmarkCardState extends State<BookmarkCard> {
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
    return (widget.isBookmarked)
        ? Icons.bookmark
        : Icons.bookmark_outline;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          print(widget.id);
          print(widget.title);
          print(widget.description);

          context.go('/${widget.type!.name}/${widget.id}');
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
                  print('Bookmark ${widget.type}');

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
