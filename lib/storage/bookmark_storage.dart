import 'package:hive/hive.dart';
import 'package:jungers_psalter/models/enums/entity_type.dart';

class BookmarkStorage {
  static getBookmarks(EntityType type) {
    List<int> bookmarksIds = [];
    final box = Hive.box(name: type.name);
    for (var i = 0; i < box.length; i++) {
      bookmarksIds.add(box.getAt(i));
    }

    return bookmarksIds;
  }

  static addBookmark(EntityType type, int value) {
    final box = Hive.box(name: type.name);
    box.add(value);
  }

  static deleteBookmark(EntityType type, int value) {
    final box = Hive.box(name: type.name);
    for (var i = 0; i < box.length; i++) {
      if (box.getAt(i) == value) {
        box.deleteAt(i);
      }
    }
  }

  static deleteBookmarks(EntityType type, List<int> values) {
    for(var value in values) {
      BookmarkStorage.deleteBookmark(type, value);
    }
  }
}
