import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jungers_psalter/models/enums/entity_type.dart';
import 'package:jungers_psalter/storage/bookmark_storage.dart';

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
        title: Text(context.tr('appTitle'), style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: this.renderBookmarks(),
    );
  }

  Widget renderBookmarks() {
    BookmarkStorage.addBookmark(EntityType.psalm, 15);
    String listOfBookmarks = BookmarkStorage.getBookmarks(EntityType.psalm).toString();
    return Column(
      children: [
        Text(listOfBookmarks),
      ],
    );
  }
}
