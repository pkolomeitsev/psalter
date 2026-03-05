import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orth_psalter/helpers/debouncer_helper.dart';
import 'package:orth_psalter/models/enums/entity_type.dart';
import 'package:orth_psalter/models/notifiers/last_viewed_notifier.dart';
import 'package:orth_psalter/storage/bookmark_storage.dart';

class BookmarkCard extends StatefulWidget {
  final int id;
  final String title;
  final String description;
  final EntityType type;
  final bool isBookmarked;
  final bool isActive;
  final LastViewedNotifier? notifier;

  const BookmarkCard({
    super.key,
    required this.id,
    required this.title,
    this.description = '',
    this.type = EntityType.none,
    this.isBookmarked = false,
    this.isActive = false,
    this.notifier = null,
  });

  @override
  State<BookmarkCard> createState() => _BookmarkCardState();
}

class _BookmarkCardState extends State<BookmarkCard> {
  final debouncer = DebouncerHelper();
  bool isBookmarkedState = false;
  bool isActiveState = false;

  @override
  void initState() {
    super.initState();
    this.isBookmarkedState = widget.isBookmarked;
    this.isActiveState = widget.isActive;
  }

  @override
  void didUpdateWidget(covariant BookmarkCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    this.isActiveState = widget.isActive;
  }

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
    return (this.isBookmarkedState)
        ? Icons.bookmark
        : Icons.bookmark_outline;
  }

  ShapeBorder? getBorderStyle(context) {
    return (this.isActiveState)
        ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
              color: Colors.blue[700]!.withValues(alpha: 0.5),
              width: 2,
            ),
          )
        : Theme.of(context).cardTheme.shape;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: this.getBorderStyle(context),
      child: InkWell(
        onTap: () {
          if (widget.notifier != null) {
            widget.notifier!.notify(widget.id, widget.type);
          }

          context.go('/${widget.type.name}/${widget.id}');
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
                onPressed: () {
                  debouncer.run(() => setState(() {
                    isBookmarkedState = !isBookmarkedState;
                    if(isBookmarkedState) {
                      BookmarkStorage.addBookmark(
                          widget.type,
                          widget.id
                      );

                      return;
                    }

                    BookmarkStorage.deleteBookmark(
                        widget.type,
                        widget.id
                    );
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
